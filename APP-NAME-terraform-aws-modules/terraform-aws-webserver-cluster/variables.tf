# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  type        = string
}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "name" {
  description = "The name for the ASG. This name is also used to namespace all the other resources created by this module."
  type        = string
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  type        = number
  default     = 1
  description = "The minimum number of EC2 Instances in the ASG"
}

variable "max_size" {
  type        = number
  default     = 1
  description = "The maximum number of EC2 Instances in the ASG"
}

variable "enable_autoscaling" {
  type        = bool
  default     = false
  description = "If set to true, enable auto scaling"
}

variable "userdata_custom" {
  type        = string
  description = "Instance user data. Do not pass gzip-compressed data via this argument"
}

variable "lb_health_check" {
  type        = string
  default     = "/"
  description = "Define health check path for Load Balancer"
}

variable "loadbalancer_ssl_policy" {
  default = ""
}

variable "loadbalancer_certificate_arn" {
  default = ""
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

/*variable "ami" {
  description = "The AMI to run in the cluster"
  default     = "ami-0c55b159cbfafe1f0"
  type        = string
}*/

/*variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}*/

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

/*variable "allowed_cidrs" {
  description = "The port the server will use for HTTP requests"
  type        = list(string)
}*/

variable "vpc_id" {
  type        = string
  description = "VPC ID to associte hosted zone with"
  default     = null
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets to place instances and Load Balancer"
  default     = null
}

variable "private_subnets" {
  type        = list(string)
  description = "List of public subnets to place instances and Load Balancer"
  default     = null
}

variable "ec2_security_group_description" {
  type        = string
  default     = "Allow inbound traffic from provided Security Groups and CIDR blocks"
  description = "Description for Elastic Beanstalk security group"
}

variable "alb_security_group_description" {
  type        = string
  default     = "Description of Load balancer managed security group"
  description = "Description of Load balancer managed security group"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_out_during_business_hours_recurrence" {
  type        = string
  default     = "0 7 * * *"
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_out_during_business_hours_min_size" {
  type        = number
  default     = 2
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_out_during_business_hours_max_size" {
  type        = number
  default     = 4
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_out_during_business_hours_desired_capacity" {
  type        = number
  default     = 1
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_in_at_night_min_size" {
  type        = number
  default     = 1
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_in_at_night_max_size" {
  type        = number
  default     = 1
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_in_at_night_desired_capacity" {
  type        = number
  default     = 1
  description = "The name of SSH public key. It must exists in AWS."
}

variable "scale_in_at_night_recurrence" {
  type        = string
  default     = "0 19 * * *"
  description = "The name of SSH public key. It must exists in AWS."
}

variable "associate_public_ip" {
  type        = bool
  default     = false
  description = "Associate a public ip address with an instance in a VPC."
}

variable "elb_security_group_description" {
  type        = string
  default     = "Description of Load balancer managed security group"
  description = "Description of Load balancer managed security group"
}

variable "elb_ingress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    description     = string
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as ingress rule defined for Autoscaling Launch Configuration security group."
}

variable "elb_ingress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default     = []
  description = "Define allowed cidr blocks as list of objects that will be used as ingress rule defined in Autoscaling Launch Configuration security group."
}

variable "elb_egress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as egress rule defined in Autoscaling Launch Configuration security group."
}

variable "elb_egress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }]
  description = "Define allowed cidr blocks as list of objects that will be used as egress rule defined for Autoscaling Launch Configuration security group."
}


variable "custom_ami" {
  type        = bool
  default     = false
  description = "THe name of AMI which you want to use. It's used in ami datasource"
}

variable "ami_id" {
  type        = string
  default     = null
  description = "Set custom AMI id for base image. If not set default (Ubuntu 18.04) will be used insted"
}

variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "IAM to attach to Ec2 instances in launch configuration"
}

variable "desired_capacity" {
  type        = number
  default     = 1
  description = "Autoscaling desired capacity"
}

variable "disable_min_elb_capacity" {
  type        = bool
  default     = false
  description = "Wait for at least this many instances to pass health checks before considering the ASG deployment complete"
}

/*variable "private_ec2" {
  type        = bool
  default     = true
  description = "Autoscling will create Ec2 in private subnet."
}*/

variable "is_build_server" {
  type        = bool
  default     = false
  description = "Set to true if you want to create build server."
}

variable "cw_event_rule" {
  type        = bool
  default     = false
  description = "If set to true, Cloudwatch event rule along with needed IAM role and policies will be created"
}

variable "cloudwatch_event_rule_schedule_expression" {
  type    = string
  default = null
}

variable "enable_alb" {
  default     = true
  description = "Wheter or not to use Load Blancer. We can only have autoscaling group or as well just single Ec2 instance."
}

variable "ec2_ingress_allowed_cidr_blocks" {
  type    = list(string)
  default = []
}

#-----------------------------------------------------------------------------------------------------------------------
# Single Ec2
#-----------------------------------------------------------------------------------------------------------------------

variable "single_ec2" {
  type    = bool
  default = false
}

variable "ami_os" {
  type        = string
  description = "Either Ubuntu 16.04 or Amazon Linux2. Valid values: ubuntu_16_04 | amazon_linux2"
  default     = null
}

variable "subnet_type" {
  type        = string
  default     = "private"
  description = "Subnet type in whic Ec2 instance will be deployed."
}