/*data "template_file" "grafana" {
  template = file("${path.module}/task_definitions/grafana.json")

  vars = {
    image_url        = var.image_url
    log_group_region = var.region
    log_group_name   = aws_cloudwatch_log_group.grafana.name
  }
}*/

/*variable "task_definition_template" {
  type        = map(string)
  description = "Map of ... . e.g. task_definition_variables = { = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}

variable "task_definition_variables" {
  type    = map(string)
  description = "Map of template variables"
  default = {}
}*/

data "template_file" "grafana" {
  # count = var.enabled && length(keys(var.task_definition_template)) > 0 ? length(keys(var.task_definition_template)) : 0
  count = var.enabled ? 1 : 0
  # template = file(element(values(local.task_definition_template), count.index))
  template = file("${path.module}/task_definitions/grafana.json")

  vars = {
    # log_group_name   = aws_cloudwatch_log_group.grafana.name
    for var, value in local.task_definition_variables :
    var => value
  }
}

resource "aws_ecs_cluster" "grafana" {
  count = var.enabled ? 1 : 0
  name  = "grafana"
}

resource "aws_ecr_repository" "grafana" {
  count = var.enabled ? 1 : 0
  name  = "grafana"
}

resource "aws_ecs_task_definition" "grafana" {
  count                    = var.enabled ? 1 : 0
  family                   = "grafana_task_definition"
  container_definitions    = data.template_file.grafana[count.index].rendered
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  task_role_arn            = aws_iam_role.grafana_ecs_task.arn
  execution_role_arn       = aws_iam_role.grafana_ecs_task_execution.arn
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "grafana" {
  count           = var.enabled ? 1 : 0
  name            = "grafana"
  cluster         = aws_ecs_cluster.grafana[count.index].name
  task_definition = aws_ecs_task_definition.grafana[count.index].arn
  desired_count   = var.grafana_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.grafana_ecs.id]
    subnets         = var.subnets
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.grafana.arn
    container_name   = "grafana"
    container_port   = 3000
  }

  depends_on = [aws_lb.grafana]

  lifecycle {
    ignore_changes = [desired_count, task_definition]
  }
}

resource "aws_cloudwatch_log_group" "grafana" {
  # name = "grafana"
  name = var.grafana_cw_log_group_name
}

resource "aws_security_group" "grafana_ecs" {
  description = "ingress to the grafana fargate task from the alb"

  vpc_id = var.vpc_id
  name   = "grafana-ecs"

  //nginx
  ingress {
    protocol        = "tcp"
    from_port       = 3000
    to_port         = 3000
    security_groups = [aws_security_group.grafana_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

