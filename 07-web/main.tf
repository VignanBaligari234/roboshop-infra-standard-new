module "web" {
    source = "../../terraform-roboshop-app"
    common_tags = var.common_tags
    project_name = var.project_name
    env = var.env

    #target group
    health_check = var.health_check
    target_group_port = var.target_group_port
    vpc_id = data.aws_ssm_parameter.vpc_id.value

    #launch template
    image_id = data.aws_ami.devops_ami.id
    security_group_id = data.aws_ssm_parameter.web_sg_id.value
    user_data = filebase64("${path.module}/web.sh")
    launch_template_tags = var.launch_template_tags

    #Auto Scaling
    vpc_zone_identifier = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
    tag = var.autoscaling_tags

    #Autoscaling Policy, I am good with optional params

    #Listner Rule
    alb_listner_arn = data.aws_ssm_parameter.web_alb_listener_arn.value
    rule_priority = 10
    host_header = "vignanlabs.online"
}