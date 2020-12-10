variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "rolling_update_enable" {
  type        = bool
  description = "If true, enables rolling updates for an environment. Rolling updates are useful when you need to make small, frequent updates to your Elastic Beanstalk software application and you want to avoid application downtime."
  default     = true
}

variable "region" {
  type = string
}

variable "eb_application" {
  type        = string
  default     = null
  description = "The name of ELastic Beanstalk application"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "description" {
  type        = string
  default     = ""
  description = "Short description of the Environment"
}

variable "phpini_memory" {
  type        = string
  default     = "256M"
  description = "Amount of memory allocated to the PHP environment."
}

variable "config_document" {
  default     = "{ \"CloudWatchMetrics\": {}, \"Version\": 1}"
  description = "A JSON document describing the environment and instance metrics to publish to CloudWatch."
}

variable "enhanced_reporting_enabled" {
  default     = true
  description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
}

variable "health_streaming_enabled" {
  default     = false
  description = "For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system."
}

variable "health_streaming_delete_on_terminate" {
  default     = false
  description = "Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days."
}

variable "health_streaming_retention_in_days" {
  default     = "7"
  description = "The number of days to keep the archived health data before it expires."
}

variable "healthcheck_url" {
  default     = "/"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

/*variable "listener_protocol" {
  default     = "/"
  description = "The protocol used by the listener. Valid values: HTTP | TCP"
}*/

variable "healthcheck_protocol" {
  default     = "HTTP"
  description = "Application Health Check protocol."
}

//variable "https_healthcheck_protocol" {
//  default     = "HTTPS"
//  description = "Application HTTPS Health Check protocol."
//}

variable "healthcheck_success_treshold" {
  default     = "Ok"
  description = "Lower the threshold for instances to pass health checks. Valid values: Ok | Warning | Degraded | Server"
}

variable "notification_protocol" {
  default     = "email"
  description = "Notification protocol"
}

variable "notification_endpoint" {
  default     = ""
  description = "Notification endpoint"
}

variable "notification_topic_arn" {
  default     = ""
  description = "Notification topic arn"
}

variable "notification_topic_name" {
  default     = ""
  description = "Notification topic name"
}

variable "enable_log_publication_control" {
  default     = false
  description = "Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application."
}

variable "enable_stream_logs" {
  default     = false
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment."
}

variable "logs_delete_on_terminate" {
  default     = false
  description = "Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days."
}

variable "logs_retention_in_days" {
  default     = "7"
  description = "The number of days to keep log events before they expire."
}

variable "environment_type" {
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `public_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
}

variable "loadbalancer_type" {
  default     = "application"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "loadbalancer_certificate_arn" {
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "loadbalancer_ssl_policy" {
  default     = ""
  description = "Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer."
}

variable "loadbalancer_security_groups" {
  type        = list(string)
  default     = []
  description = "Load balancer security groups"
}

variable "loadbalancer_managed_security_group" {
  type        = string
  default     = ""
  description = "Load balancer managed security group"
}

variable "http_listener_enabled" {
  default     = "false"
  description = "Enable port 80 (http)"
}

variable "application_port" {
  default     = "80"
  description = "Port application is listening on"
}

variable "health_check_timeout" {
  default     = "5"
  description = "Amount of time to wait for a health check response."
}

variable "health_check_interval" {
  default     = "15"
  description = "Amount of time between health checks of an individual instance. The interval must be greater than the timeout."
}

variable "unhealthy_threshold_count" {
  default     = "5"
  description = "The number of consecutive health check failures required to designate the instance as unhealthy."
}

variable "healthy_threshold_count" {
  default     = "3"
  description = "The number of consecutive successful health checks required to designate the instance as healthy."
}

variable "instance_protocol" {
  default     = "HTTP"
  description = "The protocol that this listener uses to communicate with the EC2 instances."
}

variable "stickiness_enabled" {
  default     = "false"
  description = "Set to true to enable sticky sessions"
}

variable "stickiness_lb_cookie_duration" {
  default     = "86400"
  description = "Lifetime, in seconds, of the sticky session cookie, default one day"
}

variable "ssh_listener_enabled" {
  default     = "false"
  description = "Enable ssh port"
}

variable "ssh_listener_port" {
  default     = "22"
  description = "SSH port"
}

variable "zone_id" {
  default     = null
  description = "Route53 parent zone ID. The module will create sub-domain DNS records in the parent zone for the EB environment"
}

variable "config_source" {
  default     = ""
  description = "S3 source for config"
}

variable "enable_managed_actions" {
  default     = true
  description = "Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`"
}

variable "preferred_start_time" {
  default     = "Tue:04:00"
  description = "Configure a maintenance window for managed actions in UTC"
}

variable "update_level" {
  default     = "minor"
  description = "The highest level of update to apply with managed platform updates"
}

variable "connection_draining_enabled" {
  default     = "false"
  description = "Specifies whether the load balancer maintains existing connections to instances that have become unhealthy or deregistered to complete in-progress requests."
}

variable "connection_draining_timeout" {
  default     = "20"
  description = "The maximum number of seconds that the load balancer maintains existing connections to an instance during connection draining before forcibly closing the connections."
}

variable "cross_zone" {
  default     = true
  description = "Configure the load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone."
}

variable "batch_size" {
  default     = 50
  description = "Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group on which to simultaneously perform deployments. Valid values vary per BatchSizeType setting. 1 to 100 (Percentage). | 1 to aws:autoscaling:asg::MaxSize (Fixed)"
}

variable "batch_size_type" {
  default     = "Percentage"
  description = "The type of number that is specified in BatchSize. Valid values: Percentage | Fixed"
}

variable "instance_refresh_enabled" {
  default     = "true"
  description = "Enable weekly instance replacement."
}

/*variable "security_groups" {
  type        = list(string)
  description = "List of security groups to be allowed to connect to the EC2 instances"
}*/

variable "app" {
  type        = string
  default     = null
  description = "Elastic Beanstalk application name"
}

variable "vpc_id" {
  description = "ID of the VPC in which to provision the AWS resources"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets to place Elastic Load Balancer"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets to place EC2 instances"
}

variable "keypair" {
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
  default     = ""
}

variable "root_volume_size" {
  default     = "8"
  description = "The size of the EBS root volume"
}

variable "root_volume_type" {
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "as_availability_zones" {
  default     = "Any 2"
  description = "Choose the number of AZs for your instances"
}

variable "rolling_update_type" {
  default     = "Health"
  description = "Time-based rolling updates apply a PauseTime between batches. Health-based rolling updates wait for new instances to pass health checks before moving on to the next batch. Immutable updates launch a full set of instances in a new AutoScaling group. Valid values: | Time | Health | Immutable"
}

variable "deployment_policy" {
  default     = "RollingWithAdditionalBatch"
  description = "Choose a deployment policy for application version deployments.Valid values: AllAtOnce | Rolling | RollingWithAdditionalBatch | Immutable"
}

variable "updating_min_in_service" {
  default     = "1"
  description = "Minimum count of instances up during update"
}

variable "updating_max_batch" {
  default     = "1"
  description = "Maximum count of instances up during update"
}

variable "ssh_source_restriction" {
  default = "0.0.0.0/0"
  # default     = null
  description = "Used to lock down SSH access to the EC2 instances."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instances type"
}

variable "monitoring_interval" {
  default     = "5"
  description = "Interval at which you want Amazon CloudWatch metrics returned- Valid values are: 1 | 5"
}

variable "associate_public_ip_address" {
  default     = "false"
  description = "Specifies whether to launch instances in your VPC with public IP addresses."
}

variable "autoscale_measure_name" {
  default     = "CPUUtilization"
  description = "Metric used for your Auto Scaling trigger"
}

variable "autoscale_period" {
  default     = "5"
  description = "Specifies how frequently Amazon CloudWatch measures the metrics for your trigger. The value is the number of minutes between two consecutive periods."
}

variable "autoscale_statistic" {
  default     = "Average"
  description = "Statistic the trigger should use, such as Average"
}

variable "autoscale_unit" {
  default     = "Percent"
  description = "Unit for the trigger measurement, such as Bytes"
}

variable "autoscale_lower_bound" {
  default     = "20"
  description = "Minimum level of autoscale metric to remove an instance"
}

variable "autoscale_lower_increment" {
  default     = "-1"
  description = "How many Amazon EC2 instances to remove when performing a scaling activity."
}

variable "autoscale_upper_bound" {
  default     = "80"
  description = "Maximum level of autoscale metric to add an instance"
}

variable "autoscale_upper_increment" {
  default     = "1"
  description = "How many Amazon EC2 instances to add when performing a scaling activity"
}

variable "autoscale_min" {
  default     = "1"
  description = "Minumum instances in charge"
}

variable "autoscale_max" {
  default     = "3"
  description = "Maximum instances in charge"
}

variable "autoscale_breach_duration" {
  default     = "5"
  description = "Amount of time, in minutes, a metric can be beyond its defined limit (as specified in the UpperThreshold and LowerThreshold) before the trigger fires.. Valid values: 1 to 600"
}

variable "solution_stack_name" {
  default     = ""
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. [Read more](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html)"
}

variable "wait_for_ready_timeout" {
  default     = "20m"
  description = "The maximum duration that Terraform should wait for an Elastic Beanstalk Environment to be in a ready state before timing out."
}

# From: http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region
# Via: https://github.com/hashicorp/terraform/issues/7071
variable "alb_zone_id" {
  type = map(string)

  default = {
    ap-northeast-1 = "Z1R25G3KIG2GBW"
    ap-northeast-2 = "Z3JE5OI70TWKCP"
    ap-south-1     = "Z18NTBI3Y7N9TZ"
    ap-southeast-1 = "Z16FZ9L249IFLT"
    ap-southeast-2 = "Z2PCDNR3VC2G1N"
    ca-central-1   = "ZJFCZL7SSZB5I"
    eu-central-1   = "Z1FRNW7UH4DEZJ"
    eu-west-1      = "Z2NYPWQ7DFZAZH"
    eu-west-2      = "Z1GKAAAUGATPF1"
    sa-east-1      = "Z10X7K2B4QSOFV"
    us-east-1      = "Z117KPS5GTRQ2G"
    us-east-2      = "Z14LCN19Q5QHIC"
    us-west-1      = "Z1LQECGX5PH1X"
    us-west-2      = "Z38NKT9BP95V3O"
    eu-west-3      = "ZCMLWB8V5SYIT"
  }

  description = "ALB zone id"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "environment_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_vars_custom" {
  default     = {}
  type        = map(string)
  description = "Map of custom ENV variables to be provided to the Jenkins application running on Elastic Beanstalk, e.g. `env_vars = { JENKINS_USER = 'admin' JENKINS_PASS = 'xxxxxx' }`"
}

variable "tier" {
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
}

variable "version_label" {
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}

variable "nodejs_version" {
  default     = ""
  description = "Elastic Beanstalk NodeJS version to deploy"
}

variable "force_destroy" {
  default     = false
  description = "Destroy S3 bucket for load balancer logs"
}

variable "ignore_health_check" {
  default     = false
  description = "Do not cancel a deployment due to failed health checks."
}

variable "elb_scheme" {
  default     = "public"
  description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
}

variable "ec2_role" {
  default     = null
  description = "Custom Elastic Eeanstalk Ec2 instance profile role to attach, used in autoscaling launch configuration. If null, default role will be used created in module."
}

variable "eb_ec2_security_group_id" {
  type        = string
  default     = null
  description = "List of security group ids to be attached to Elastic Beanstalk Ec2 instance"
}

/*variable "ec2_security_group_description" {
  type        = string
  default     = "Allow inbound traffic from provided Security Groups and CIDR blocks"
  description = "Description for Elastic Beanstalk security group"
}

variable "ec2_ingress_allowed_security_groups" {
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

variable "ec2_ingress_allowed_cidr_blocks" {
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

variable "ec2_egress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as egress rule defined in Autoscaling Launch Configuration security group."
}

variable "ec2_egress_allowed_cidr_blocks" {
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
}*/

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

variable "eb_dns_name" {
  type        = string
  description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
  default     = ""
}

variable "eb_dns_ttl" {
  type        = number
  description = "TTL setting for Elastic Beanstalk DNS"
  default     = 300
}

variable "sleep" {
  type        = number
  default     = 60
  description = "Time in seconds. After updating configuration template, how long to wait before starting with environment update."
}

/*variable "option_name_rds_password" {
  description = "Elastic Beanstalk option name for database password environment variable (Namespace=aws:elasticbeanstalk:application:environment,OptionName=$OPTION_NAME_RDS_PASSWORD,Value=$RDS_PASSWORD)"
  type        = string
  default     = "RDS_PASSWORD"
}*/

variable "ec_host" {
  type    = string
  default = "master.elasticache.redis.dns"
}

variable "fs_s3_bucket" {
  type    = string
  default = "s3-filesystem"
}

variable "rds_hostname" {
  type    = string
  default = "master.rds.dns"
}

variable "rds_db_name" {
  type    = string
  default = "APP-NAME"
}

variable "rds_username" {
  type    = string
  default = "admin"
}

variable "rds_password" {
  type    = string
  default = "SoMeFaKePa$sWoRd!"
}

variable "rds_APP-NAME_secret_id" {
  type    = string
  default = null
}

variable "sengrid_smtp_secret_id" {
  type    = string
  default = null
}

variable "sengrid_smtp_username" {
  default = null
}

variable "sengrid_smtp_password" {
  default = null
}

#-----------------------------------------------------------------------------------------------------------------------
# Autoscaling schedule action

variable "asg_start_schedule_start_time" {
  default     = ""
  description = "For one-time actions, choose the date and time to run the action. For recurrent actions, choose when to activate the action."
}

variable "asg_start_schedule_end_time" {
  default     = ""
  description = "Example: 2015-04-28T04:07:2Z | A date and time in the future (in the UTC/GMT time zone) when you want the scheduled scaling action to stop repeating. If you don't specify an EndTime, the action recurs according to the Recurrence expression. When a scheduled action ends, Amazon EC2 Auto Scaling does not automatically go back to its previous settings. Configure a second scheduled action to return to the original settings as needed."
}

variable "asg_start_schedule_max_size" {
  default     = ""
  type        = string
  description = "The maximum instance count to apply when the action runs."
}

variable "asg_start_schedule_min_size" {
  default     = ""
  type        = string
  description = "The minimum instance count to apply when the action runs."
}

variable "asg_start_schedule_desired_capacity" {
  default     = ""
  description = "Set the initial desired capacity for the Auto Scaling group. After the scheduled action is applied, triggers will adjust the desired capacity based on their settings."
  type        = string
}

variable "asg_start_schedule_recurrence" {
  default     = ""
  type        = string
  description = "The frequency with which you want the scheduled action to occur. If you do not specify a recurrence, then the scaling action will occur only once, as specified by the StartTime."
}

variable "asg_start_schedule_suspend" {
  default     = ""
  type        = string
  description = "Set to true to deactivate a recurrent scheduled action temporarily. Valid values true | false"
}

variable "asg_stop_schedule_stop_time" {
  default     = ""
  description = "For one-time actions, choose the date and time to run the action. For recurrent actions, choose when to activate the action."
}

variable "asg_stop_schedule_end_time" {
  default     = ""
  description = "Example: 2015-04-28T04:07:2Z | A date and time in the future (in the UTC/GMT time zone) when you want the scheduled scaling action to stop repeating. If you don't specify an EndTime, the action recurs according to the Recurrence expression. When a scheduled action ends, Amazon EC2 Auto Scaling does not automatically go back to its previous settings. Configure a second scheduled action to return to the original settings as needed."
}

variable "asg_stop_schedule_max_size" {
  default     = ""
  type        = string
  description = "The maximum instance count to apply when the action runs."
}

variable "asg_stop_schedule_min_size" {
  default     = ""
  type        = string
  description = "The minimum instance count to apply when the action runs."
}

variable "asg_stop_schedule_desired_capacity" {
  default     = ""
  description = "Set the initial desired capacity for the Auto Scaling group. After the scheduled action is applied, triggers will adjust the desired capacity based on their settings."
  type        = string
}

variable "asg_stop_schedule_recurrence" {
  default     = ""
  type        = string
  description = "The frequency with which you want the scheduled action to occur. If you do not specify a recurrence, then the scaling action will occur only once, as specified by the StartTime."
}

variable "asg_stop_schedule_suspend" {
  default     = ""
  type        = string
  description = "Set to true to deactivate a recurrent scheduled action temporarily. Valid values true | false"
}

variable "ec2_service_role_id" {
  type        = string
  default     = null
  description = "The id of Ec2 IAM service role"
}

variable "ec2_service_role_name" {
  type        = string
  default     = null
  description = "The name of Ec2 IAM service role"
}

variable "eb_service_role_name" {
  type        = string
  default     = null
  description = "The name of EB IAM service role"
}

variable "app_version_label" {
  type        = string
  default     = null
  description = "The name of the Elastic Beanstalk Application Version to use in deployment."
}

variable "s3_lifecycle_rules" {
  type = list(object({
    enabled = bool # (Required) Specifies lifecycle rule status

    id     = string # (Optional) Unique identifier for the rule.
    prefix = string #  (Optional) Object key prefix identifying one or more objects to which the rule applies. Set to "null" in order to apply to whole bucket

    abort_incomplete_multipart_upload_days = number # (Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed.

    expiration = list(object({
      days = number # (Optional) Specifies the date after which you want the corresponding action to take effect.
      date = string # (Optional) Specifies the number of days after object creation when the specific rule action takes effect.

      expired_object_delete_marker = bool # On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers.
    }))

    noncurrent_version_expiration = list(object({
      days = number # (Required) Specifies the number of days noncurrent object versions expire.
    }))

    transition = list(object({
      days          = number # (Optional) Specifies the date after which you want the corresponding action to take effect.
      date          = string # (Optional) Specifies the number of days after object creation when the specific rule action takes effect.
      storage_class = string # (Required) Specifies the Amazon S3 storage class to which you want the object to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }))

    noncurrent_version_transition = list(object({
      days          = number # (Required) Specifies the number of days noncurrent object versions transition.
      storage_class = string #  (Required) Specifies the Amazon S3 storage class to which you want the noncurrent object versions to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }))
  }))

  default = [{
    enabled = true
    id      = "s3_lifecycle_rule"
    prefix  = null

    abort_incomplete_multipart_upload_days = 7

    expiration = [{
      days = 90
      date = null

      expired_object_delete_marker = false
    }]

    noncurrent_version_expiration = [{
      days = 90
    }]

    transition                    = []
    noncurrent_version_transition = []
  }]
}

variable "rotate_secret" {
  type        = bool
  default     = false
  description = "If set to true it will create null_resource which will trigger secret rotation."
}

variable "rotation_lambda_arn" {
  type        = string
  default     = null
  description = "Provide the ARN of Lambda function responsible for rotation secret (RDS password for application database user)"
}