module "vpn_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id 
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
#   if we don't give subnet id here the instance will go and provision inside default vpc subnet
#   subnet_id = local.public_subnet_ids[0] 
  tags = merge(
    {
        Name = "Roboshop-VPN"
    },
    var.common_tags
  )
}