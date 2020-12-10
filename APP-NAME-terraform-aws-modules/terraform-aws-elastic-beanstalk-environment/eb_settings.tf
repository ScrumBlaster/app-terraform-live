locals {

  eb_settings = [
    #------------------------------------------------------------------------------------------------------------------
    # Amount of memory allocated to the PHP environment
    {
      namespace = "aws:elasticbeanstalk:container:php:phpini"
      name      = "memory_limit"
      value     = var.phpini_memory
    },
    #------------------------------------------------------------------------------------------------------------------
    # AssociatePublicIpAddress
    {
      namespace = "aws:ec2:vpc"
      name      = "AssociatePublicIpAddress"
      value     = var.associate_public_ip_address
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Subnets
    {
      namespace = "aws:ec2:vpc"
      name      = "Subnets"
      value     = join(",", var.private_subnets)
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ELBSubnets
    {
      namespace = "aws:ec2:vpc"
      name      = "ELBSubnets"
      value     = join(",", var.public_subnets)
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RollingUpdateEnabled
    {
      namespace = "aws:autoscaling:updatepolicy:rollingupdate"
      name      = "RollingUpdateEnabled"
      value     = var.rolling_update_enable
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RollingUpdateType
    {
      namespace = "aws:autoscaling:updatepolicy:rollingupdate"
      name      = "RollingUpdateType"
      value     = var.rolling_update_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # MinInstancesInService
    {
      namespace = "aws:autoscaling:updatepolicy:rollingupdate"
      name      = "MinInstancesInService"
      value     = var.updating_min_in_service
    },

    #-------------------------------------------------------------------------------------------------------------------
    # DeploymentPolicy
    {
      namespace = "aws:elasticbeanstalk:command"
      name      = "DeploymentPolicy"
      value     = var.deployment_policy
    },

    #-------------------------------------------------------------------------------------------------------------------
    # MaxBatchSize
    {
      namespace = "aws:autoscaling:updatepolicy:rollingupdate"
      name      = "MaxBatchSize"
      value     = var.updating_max_batch
    },

    ###=========================== Logging ========================== ###

    #-------------------------------------------------------------------------------------------------------------------
    # LogPublicationControl
    {
      namespace = "aws:elasticbeanstalk:hostmanager"
      name      = "LogPublicationControl"
      value     = var.enable_log_publication_control ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # StreamLogs
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs"
      name      = "StreamLogs"
      value     = var.enable_stream_logs ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # DeleteOnTerminate
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs"
      name      = "DeleteOnTerminate"
      value     = var.logs_delete_on_terminate ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RetentionInDays
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs"
      name      = "RetentionInDays"
      value     = var.logs_retention_in_days
    },

    #-------------------------------------------------------------------------------------------------------------------
    # HealthStreamingEnabled
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
      name      = "HealthStreamingEnabled"
      value     = var.health_streaming_enabled ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # DeleteOnTerminate
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
      name      = "DeleteOnTerminate"
      value     = var.health_streaming_delete_on_terminate ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RetentionInDays
    {
      namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
      name      = "RetentionInDays"
      value     = var.health_streaming_retention_in_days
    },

    ###=========================================== Autoscale trigger ================================================###
    #-------------------------------------------------------------------------------------------------------------------
    # MeasureName
    {
      namespace = "aws:autoscaling:trigger"
      name      = "MeasureName"
      value     = var.autoscale_measure_name
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Statistic
    {
      namespace = "aws:autoscaling:trigger"
      name      = "Statistic"
      value     = var.autoscale_statistic
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Unit
    {
      namespace = "aws:autoscaling:trigger"
      name      = "Unit"
      value     = var.autoscale_unit
    },

    #-------------------------------------------------------------------------------------------------------------------
    # LowerThreshold
    {
      namespace = "aws:autoscaling:trigger"
      name      = "LowerThreshold"
      value     = var.autoscale_lower_bound
    },

    #-------------------------------------------------------------------------------------------------------------------
    # LowerBreachScaleIncrement
    {
      namespace = "aws:autoscaling:trigger"
      name      = "LowerBreachScaleIncrement"
      value     = var.autoscale_lower_increment
    },

    #-------------------------------------------------------------------------------------------------------------------
    # UpperThreshold
    {
      namespace = "aws:autoscaling:trigger"
      name      = "UpperThreshold"
      value     = var.autoscale_upper_bound
    },

    #-------------------------------------------------------------------------------------------------------------------
    # UpperBreachScaleIncrement
    {
      namespace = "aws:autoscaling:trigger"
      name      = "UpperBreachScaleIncrement"
      value     = var.autoscale_upper_increment
    },

    #-------------------------------------------------------------------------------------------------------------------
    # BreachDuration
    {
      namespace = "aws:autoscaling:trigger"
      name      = "BreachDuration"
      value     = var.autoscale_breach_duration
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Period
    {
      namespace = "aws:autoscaling:trigger"
      name      = "Period"
      value     = var.autoscale_period
    },
    ###=========================================== Autoscale trigger ================================================###

    #-------------------------------------------------------------------------------------------------------------------
    # SecurityGroups
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "SecurityGroups"
      value     = var.eb_ec2_security_group_id
    },
    #-------------------------------------------------------------------------------------------------------------------
    # SSHSourceRestriction
    /*{
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "SSHSourceRestriction"
      value     = "tcp,22,22,${var.ssh_source_restriction}"
    },*/

    #-------------------------------------------------------------------------------------------------------------------
    # InstanceType
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "InstanceType"
      value     = var.instance_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # IamInstanceProfile
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = var.ec2_service_role_name
    },

    #-------------------------------------------------------------------------------------------------------------------
    # EC2KeyName
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "EC2KeyName"
      value     = var.keypair
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RootVolumeSize
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "RootVolumeSize"
      value     = var.root_volume_size
    },

    #-------------------------------------------------------------------------------------------------------------------
    # RootVolumeType
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "RootVolumeType"
      value     = var.root_volume_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # MonitoringInterval
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "MonitoringInterval"
      value     = var.monitoring_interval
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Availability Zones
    {
      namespace = "aws:autoscaling:asg"
      name      = "Availability Zones"
      value     = var.as_availability_zones,
    },

    #-------------------------------------------------------------------------------------------------------------------
    # MinSize
    {
      namespace = "aws:autoscaling:asg"
      name      = "MinSize"
      value     = var.autoscale_min
    },

    #-------------------------------------------------------------------------------------------------------------------
    # MaxSize
    {
      namespace = "aws:autoscaling:asg"
      name      = "MaxSize"
      value     = var.autoscale_max
    },

    #-------------------------------------------------------------------------------------------------------------------
    # CrossZone
    {
      namespace = "aws:elb:loadbalancer"
      name      = "CrossZone"
      value     = var.cross_zone
    },

    #-------------------------------------------------------------------------------------------------------------------
    # SecurityGroups
    {
      namespace = "aws:elb:loadbalancer"
      name      = "SecurityGroups"
      value     = join(",", var.loadbalancer_security_groups)
      # value     = join(",", concat(var.loadbalancer_security_groups, [aws_security_group.elb.id]))
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ManagedSecurityGroup
    {
      namespace = "aws:elb:loadbalancer"
      name      = "ManagedSecurityGroup"
      value     = var.loadbalancer_managed_security_group
      # value     = aws_security_group.elb.id
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ELBScheme
    {
      namespace = "aws:ec2:vpc"
      name      = "ELBScheme"
      value     = var.environment_type == "LoadBalanced" ? var.elb_scheme : ""
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerProtocol
    {
      namespace = "aws:elb:listener"
      name      = "ListenerProtocol"
      value     = "HTTP"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # InstancePort
    {
      namespace = "aws:elb:listener"
      name      = "InstancePort"
      value     = var.application_port
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elb:listener"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled == "true" || var.loadbalancer_certificate_arn == "" ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerProtocol
    {
      namespace = "aws:elb:listener:443"
      name      = "ListenerProtocol"
      value     = "HTTPS"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # InstanceProtocol
    {
      namespace = "aws:elb:listener:443"
      name      = "InstanceProtocol"
      value     = var.instance_protocol
    },

    #-------------------------------------------------------------------------------------------------------------------
    # InstancePort
    {
      namespace = "aws:elb:listener:443"
      name      = "InstancePort"
      value     = var.application_port
    },

    #-------------------------------------------------------------------------------------------------------------------
    # SSLCertificateId
    {
      namespace = "aws:elb:listener:443"
      name      = "SSLCertificateId"
      value     = var.loadbalancer_certificate_arn
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elb:listener:443"
      name      = "ListenerEnabled"
      value     = var.loadbalancer_certificate_arn == "" ? "false" : "true"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerProtocol
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "ListenerProtocol"
      value     = "TCP"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # InstancePort
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "InstancePort"
      value     = "22"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "ListenerEnabled"
      value     = var.ssh_listener_enabled,
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elb:listener:80"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled,
    },

    #--------------------------------------------------------------------------------------------------------------------
    # ConnectionSettingIdleTimeout
    {
      namespace = "aws:elb:policies"
      name      = "ConnectionSettingIdleTimeout"
      value     = var.ssh_listener_enabled == "true" ? "3600" : "60"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ConnectionDrainingEnabled
    {
      namespace = "aws:elb:policies"
      name      = "ConnectionDrainingEnabled"
      value     = var.connection_draining_enabled
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ConnectionDrainingTimeout
    {
      namespace = "aws:elb:policies"
      name      = "ConnectionDrainingTimeout"
      value     = var.connection_draining_timeout
    },

    #-------------------------------------------------------------------------------------------------------------------
    # AccessLogsS3Bucket
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "AccessLogsS3Bucket"
      value     = aws_s3_bucket.elb_logs.id
    },

    #-------------------------------------------------------------------------------------------------------------------
    # AccessLogsS3Enabled
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "AccessLogsS3Enabled"
      value     = "true"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # SecurityGroups
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "SecurityGroups"
      # value     = join(",", var.loadbalancer_security_groups)
      value = join(",", concat(var.loadbalancer_security_groups, [aws_security_group.elb.id]))
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ManagedSecurityGroup
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "ManagedSecurityGroup"
      # value     = var.loadbalancer_managed_security_group,
      value = aws_security_group.elb.id
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elbv2:listener:default"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled == "true" || var.loadbalancer_certificate_arn == "" ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ListenerEnabled
    {
      namespace = "aws:elbv2:listener:443"
      name      = "ListenerEnabled"
      value     = var.loadbalancer_certificate_arn == "" ? "false" : "true"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # HTTPS
    {
      namespace = "aws:elbv2:listener:443"
      name      = "Protocol"
      value     = "HTTPS"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # SSLCertificateArns
    {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLCertificateArns"
      value     = var.loadbalancer_certificate_arn
    },

    #-------------------------------------------------------------------------------------------------------------------
    # SSLPolicy
    {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLPolicy"
      value     = var.loadbalancer_type == "application" ? var.loadbalancer_ssl_policy : ""
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ConfigDocument
    {
      namespace = "aws:elasticbeanstalk:healthreporting:system"
      name      = "ConfigDocument"
      value     = var.config_document
    },

    #-------------------------------------------------------------------------------------------------------------------
    # Application Healthcheck URL
    //    {
    //      namespace = "aws:elasticbeanstalk:application"
    //      name      = "Application Healthcheck URL"
    //      value     = "HTTP:${var.application_port}${var.healthcheck_url}",
    //      # value     = var.healthcheck_protocol == "HTTP" ? "/${var.healthcheck_url}" : "${var.healthcheck_protocol}:${var.application_port}${var.healthcheck_url}"
    //    },

    {
      namespace = "aws:elasticbeanstalk:application"
      name      = "Application Healthcheck URL"
      # value     = "HTTP:${var.application_port}${var.healthcheck_url}",
      value = var.healthcheck_protocol == "HTTPS" ? "HTTPS:443${var.healthcheck_url}" : "HTTP:${var.application_port}${var.healthcheck_url}"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # EnvironmentType
    {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "EnvironmentType"
      value     = var.environment_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # LoadBalancerType
    {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "LoadBalancerType"
      value     = var.loadbalancer_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # ServiceRole
    {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "ServiceRole"
      # value     = aws_iam_role.service.name
      value = var.eb_service_role_name
    },

    #-------------------------------------------------------------------------------------------------------------------
    #-------------------------------------------------------------------------------------------------------------------
    # SystemType
    {
      namespace = "aws:elasticbeanstalk:healthreporting:system"
      name      = "SystemType"
      value     = var.enhanced_reporting_enabled ? "enhanced" : "basic"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # HealthCheckSuccessThreshold
    {
      namespace = "aws:elasticbeanstalk:healthreporting:system"
      name      = "HealthCheckSuccessThreshold"
      value     = var.healthcheck_success_treshold
    },

    #-------------------------------------------------------------------------------------------------------------------
    # BatchSizeType
    {
      namespace = "aws:elasticbeanstalk:command"
      name      = "BatchSizeType"
      value     = var.batch_size_type
    },

    #-------------------------------------------------------------------------------------------------------------------
    # BatchSize
    {
      namespace = "aws:elasticbeanstalk:command"
      name      = "BatchSize"
      value     = var.batch_size
    },

    #-------------------------------------------------------------------------------------------------------------------
    # IgnoreHealthCheck
    {
      namespace = "aws:elasticbeanstalk:command"
      name      = "IgnoreHealthCheck"
      value     = var.ignore_health_check
    },

    #-------------------------------------------------------------------------------------------------------------------
    # BASE_HOST
    /*{
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "BASE_HOST"
      value     = var.app
    },*/

    #-------------------------------------------------------------------------------------------------------------------
    # ManagedActionsEnabled
    {
      namespace = "aws:elasticbeanstalk:managedactions"
      name      = "ManagedActionsEnabled"
      value     = var.enable_managed_actions ? "true" : "false"
    },

    #-------------------------------------------------------------------------------------------------------------------
    # PreferredStartTime
    {
      namespace = "aws:elasticbeanstalk:managedactions"
      name      = "PreferredStartTime"
      value     = var.preferred_start_time
    },

    #-------------------------------------------------------------------------------------------------------------------
    # UpdateLevel
    {
      namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
      name      = "UpdateLevel"
      value     = var.update_level
    },

    #-------------------------------------------------------------------------------------------------------------------
    # InstanceRefreshEnabled
    {
      namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
      name      = "InstanceRefreshEnabled"
      value     = var.instance_refresh_enabled
    },

    #-------------------------------------------------------------------------------------------------------------------
    # NodeVersion
    {
      namespace = "aws:elasticbeanstalk:container:nodejs"
      name      = "NodeVersion"
      value     = var.nodejs_version
    },

    ###===================== Application Load Balancer Health check settings =====================================================###
    # The Application Load Balancer health check does not take into account the Elastic Beanstalk health check path
    # http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-applicationloadbalancer.html
    # http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-applicationloadbalancer.html#alb-default-process.config
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckPath"
      value     = var.healthcheck_url
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "Port"
      value     = var.healthcheck_protocol == "HTTPS" ? "443" : var.application_port
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "Protocol"
      value     = var.healthcheck_protocol == "HTTPS" ? "HTTPS" : "HTTP"
    },

    ###===================== Load Balancer stickiness settings =====================================================###
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "StickinessEnabled"
      value     = var.stickiness_enabled
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "StickinessLBCookieDuration"
      value     = var.stickiness_lb_cookie_duration
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckTimeout"
      value     = var.health_check_timeout
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthyThresholdCount"
      value     = var.healthy_threshold_count
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "UnhealthyThresholdCount"
      value     = var.unhealthy_threshold_count
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckInterval"
      value     = var.health_check_interval
    },
    # This should make it work with Classic Load balancer
    # https://github.com/terraform-providers/terraform-provider-aws/issues/4000
    {
      namespace = "aws:elb:policies"
      name      = "Stickiness Policy"
      value     = var.stickiness_enabled
    },
    {
      namespace = "aws:elb:policies"
      name      = "Stickiness Cookie Expiration"
      value     = var.stickiness_lb_cookie_duration
    },

    ###===================== Notification =====================================================###
    {
      namespace = "aws:elasticbeanstalk:sns:topics"
      name      = "Notification Endpoint"
      value     = var.notification_endpoint
    },
    {
      namespace = "aws:elasticbeanstalk:sns:topics"
      name      = "Notification Protocol"
      value     = var.notification_protocol
    },
    {
      namespace = "aws:elasticbeanstalk:sns:topics"
      name      = "Notification Topic ARN"
      value     = var.notification_topic_arn
    },
    {
      namespace = "aws:elasticbeanstalk:sns:topics"
      name      = "Notification Topic Name"
      value     = var.notification_topic_name
    }
  ]
}
