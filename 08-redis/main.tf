module "redis_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id 
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
  subnet_id = local.db_subnet_id
#   if we don't give subnet id here the instance will go and provision inside default vpc subnet
#   subnet_id = local.public_subnet_ids[0] 
  user_data = file("redis.sh")  
  tags = merge(
    {
        Name = "Redis"
    },
    var.common_tags
  )
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name 
  records = [
    {
      name    = "redis"
      type    = "A"
      ttl     = 1
      records = [
            module.redis_instance.private_ip
      ]
    },
  ]
}


