module "shipping" {
    source = "../../terraform-roboshop-app"
    common_tags = var.common_tags
    project_name = var.project_name
    env = var.env

    #target group
    #health_check = var.health_check
    target_group_port = var.target_group_port
    vpc_id = data.aws_ssm_parameter.vpc_id.value

    #launch template
    image_id = data.aws_ami.devops_ami.id
    security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
    user_data = filebase64("${path.module}/shipping.sh")
    launch_template_tags = var.launch_template_tags

    #Auto Scaling
    vpc_zone_identifier = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
    tag = var.autoscaling_tags

    #Autoscaling Policy, I am good with optional params

    #Listner Rule
    alb_listner_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
    rule_priority = 40 #catalogue,user,cart has pripority 10,20,30 respectivey already
    host_header = "shipping.app.vignanlabs.online"
}