terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

locals {
  tags = merge(
    var.tags,
    var.custom_tags
  )
}

data "aws_ami" "ubuntu_16_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    # values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "aws_ami" "amazon-linux2" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

locals {
  valid_subnet_types   = ["private", "public"]
  validate_subnet_type = index(local.valid_subnet_types, var.subnet_type)
}

#-----------------------------------------------------------------------------------------------------------------------
# Single Ec2 instance with Elastic IP and CUSTOM AMI
#-----------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "single_ec2_custom_ami" {
  count = var.single_ec2 && var.custom_ami ? 1 : 0

  ami                         = var.ami_id == "" ? data.aws_ami.amazon-linux2.id : var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.subnet_type == "public" ? true : false
  subnet_id                   = var.subnet_type == "public" ? var.public_subnets[count.index] : var.private_subnets[count.index]
  vpc_security_group_ids      = [aws_security_group.instance.id]
  user_data                   = var.userdata_custom
  iam_instance_profile        = var.iam_instance_profile
  # availability_zone           = var.availability_zone

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  tags = merge(
    { "Name" = "${var.environment}-${var.name}" },
    var.tags
  )
}

#-----------------------------------------------------------------------------------------------------------------------
# Single Ec2 instance with Elastic IP
#-----------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "web" {
  count = var.single_ec2 && var.custom_ami == false ? 1 : 0

  ami                         = var.ami_os == "amazon_linux2" ? data.aws_ami.amazon-linux2.id : data.aws_ami.ubuntu_16_04.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.subnet_type == "public" ? true : false
  subnet_id                   = var.subnet_type == "public" ? var.public_subnets[count.index] : var.private_subnets[count.index]
  vpc_security_group_ids      = [aws_security_group.instance.id]
  user_data                   = var.userdata_custom
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  tags = merge(
    { "Name" = "${var.environment}-${var.name}" },
    var.tags
  )
}

resource "aws_eip" "public_ip" {
  count    = var.single_ec2 && var.subnet_type == "public" ? 1 : 0
  vpc      = true
  instance = var.custom_ami ? aws_instance.single_ec2_custom_ami[0].id : aws_instance.web[0].id
}

#-----------------------------------------------------------------------------------------------------------------------
# WebserverCluster
#-----------------------------------------------------------------------------------------------------------------------

# Execute command
# export EC2_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

data "template_cloudinit_config" "master" {
  gzip          = false
  base64_encode = false

  # get custom user_data (provide custom userdata script via Terragrunt in form of 'userdata_custom = file("scripts/userdata_custom.sh")' variable)
  part {
    filename     = "userdata_custom.cfg"
    content_type = "text/x-shellscript"
    content      = var.userdata_custom
  }

}

resource "aws_launch_configuration" "default" {
  count           = var.ami_id == null && ! var.single_ec2 ? 1 : 0
  image_id        = var.ami_os == "amazon_linux2" ? data.aws_ami.amazon-linux2.id : data.aws_ami.ubuntu_16_04.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instance.id]

  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip

  # user_data = var.userdata_custom
  user_data = data.template_cloudinit_config.master.rendered

  key_name = var.key_name
  # Required when using a launch configuration with an auto scaling group.
  # https://www.terraform.io/docs/providers/aws/r/launch_configuration.html
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "default" {
  count = var.single_ec2 ? 0 : 1
  # Explicitly depend on the launch configuration's name so each time it's
  # replaced, this ASG is also replaced
  name = "${var.environment}-${var.name}-${aws_launch_configuration.default[0].name}"

  launch_configuration = aws_launch_configuration.default[0].name
  vpc_zone_identifier  = var.subnet_type == "public" ? var.public_subnets : var.private_subnets
  target_group_arns    = var.enable_alb ? [aws_lb_target_group.asg[0].arn] : []
  health_check_type    = var.enable_alb ? "ELB" : "EC2"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  # Wait for at least this many instances to pass health checks before
  # considering the ASG deployment complete
  min_elb_capacity = var.disable_min_elb_capacity ? 0 : var.min_size

  # When replacing this ASG, create the replacement first, and only delete the
  # original after
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.name}"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = {
      for key, value in local.tags :
      key => value
      if key != "Name"
    }

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  count = var.enable_autoscaling ? 1 : 0

  scheduled_action_name = "${var.environment}-${var.name}-scale-out-during-business-hours"
  min_size              = var.scale_out_during_business_hours_min_size
  max_size              = var.scale_out_during_business_hours_max_size
  desired_capacity      = var.scale_out_during_business_hours_desired_capacity
  recurrence            = var.scale_out_during_business_hours_recurrence
  # autoscaling_group_name = var.is_build_server ? aws_autoscaling_group.build_server[0].name : aws_autoscaling_group.default[0].name
  autoscaling_group_name = aws_autoscaling_group.default[0].name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  count = var.enable_autoscaling ? 1 : 0

  scheduled_action_name = "${var.environment}-${var.name}-scale-in-at-night"
  min_size              = var.scale_in_at_night_min_size
  max_size              = var.scale_in_at_night_max_size
  desired_capacity      = var.scale_in_at_night_desired_capacity
  recurrence            = var.scale_in_at_night_recurrence
  # autoscaling_group_name = var.is_build_server ? aws_autoscaling_group.build_server[0].name : aws_autoscaling_group.default[0].name
  autoscaling_group_name = aws_autoscaling_group.default[0].name
}

resource "aws_security_group" "instance" {
  name        = "${var.environment}-${var.name}-instance"
  description = var.ec2_security_group_description

  vpc_id = var.vpc_id

  # tags {}
  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-ec2"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "default" {
  count             = length(var.ec2_ingress_allowed_cidr_blocks) > 0 ? 1 : 0
  type              = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port   = var.server_port
  to_port     = var.server_port
  protocol    = local.tcp_protocol
  cidr_blocks = var.ec2_ingress_allowed_cidr_blocks

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "allow_alb_sg_traffic" {
  count             = var.enable_alb && ! var.single_ec2 ? 1 : 0
  type              = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port                = var.server_port
  to_port                  = var.server_port
  protocol                 = local.tcp_protocol
  source_security_group_id = aws_security_group.alb[0].id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ec2_allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.instance.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "example" {
  count              = var.enable_alb && ! var.single_ec2 ? 1 : 0
  name               = "${var.environment}-${var.name}-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb[0].id]

  # internal           = false

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-alb"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "https" {
  count             = var.enable_alb && var.loadbalancer_certificate_arn != "" && ! var.single_ec2 ? 1 : 0
  load_balancer_arn = aws_lb.example[0].arn
  port              = local.https_port
  protocol          = "HTTPS"

  ssl_policy      = var.loadbalancer_ssl_policy != "" ? var.loadbalancer_ssl_policy : ""
  certificate_arn = var.loadbalancer_certificate_arn != "" ? var.loadbalancer_certificate_arn : ""

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_listener" "http" {
  count             = var.enable_alb && ! var.single_ec2 ? 1 : 0
  load_balancer_arn = aws_lb.example[0].arn
  port              = local.http_port
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "asg" {
  count    = var.enable_alb && ! var.single_ec2 ? 1 : 0
  name     = "${var.environment}-${var.name}"
  port     = var.server_port
  protocol = "HTTP"
  # vpc_id   = data.aws_vpc.default.id
  # vpc_id = var.vpc_id != null ? var.vpc_id : data.aws_vpc.default.id
  vpc_id = var.vpc_id

  health_check {
    path                = var.lb_health_check
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-tg"
    }
  )
}

resource "aws_lb_listener_rule" "http" {
  count        = var.enable_alb && ! var.single_ec2 ? 1 : 0
  listener_arn = aws_lb_listener.http[0].arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg[0].arn
  }
}

resource "aws_lb_listener_rule" "https" {
  count        = var.enable_alb && var.loadbalancer_certificate_arn != "" && ! var.single_ec2 ? 1 : 0
  listener_arn = aws_lb_listener.https[0].arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg[0].arn
  }
}

# Redirect action
# In order to redirect from port http 80 to https 443, port 80 should be added as ingress rule to security group of LB

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  count        = var.enable_alb && var.loadbalancer_certificate_arn != "" && ! var.single_ec2 ? 1 : 0
  listener_arn = aws_lb_listener.http[0].arn

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

resource "aws_security_group" "alb" {
  count       = var.enable_alb && ! var.single_ec2 ? 1 : 0
  name        = "${var.environment}-${var.name}-alb"
  description = var.alb_security_group_description

  vpc_id = var.vpc_id

  # Ingress -> Allowed CIDR blocks
  dynamic "ingress" {
    for_each = [for cidr in var.elb_ingress_allowed_cidr_blocks : {
      from_port   = cidr.from_port
      to_port     = cidr.to_port
      protocol    = cidr.protocol
      cidr_blocks = cidr.cidr_blocks
      description = cidr.description
    }]

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  # Ingress -> Allow Security Group ids
  dynamic "ingress" {
    for_each = [for sg in var.elb_ingress_allowed_security_groups : {
      from_port       = sg.from_port
      to_port         = sg.to_port
      protocol        = sg.protocol
      security_groups = sg.security_groups
      description     = sg.description
    }]

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
      description     = ingress.value.description
    }
  }

  # Egress -> Allowed Security Group ids
  dynamic "egress" {
    for_each = [for sg in var.elb_egress_allowed_security_groups : {
      from_port       = sg.from_port
      to_port         = sg.to_port
      protocol        = sg.protocol
      security_groups = sg.security_groups
      # description     = sg.description
    }]

    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      security_groups = egress.value.security_groups
      # description     = egress.value.description
    }
  }

  # Egress -> Allowed CIDR blocks
  dynamic "egress" {
    for_each = [for sg in var.elb_egress_allowed_cidr_blocks : {
      from_port   = sg.from_port
      to_port     = sg.to_port
      protocol    = sg.protocol
      cidr_blocks = sg.cidr_blocks
      description = sg.description
    }]

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-alb"
    }
  )

}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  count = var.single_ec2 ? 0 : 1

  alarm_name  = "${var.environment}-${var.name}-high-cpu-utilization"
  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"

  dimensions = {
    # AutoScalingGroupName = var.is_build_server ? aws_autoscaling_group.build_server[0].name : aws_autoscaling_group.default[0].name
    AutoScalingGroupName = aws_autoscaling_group.default[0].name
  }

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  period              = 300
  statistic           = "Average"
  threshold           = 90
  unit                = "Percent"

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-ec2"
    }
  )
}

locals {
  http_port    = 80
  https_port   = 443
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
  # allowed_cidrs = var.allowed_cidrs != null ? var.allowed_cidrs : local.all_ips
}