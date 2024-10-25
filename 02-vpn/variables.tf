variable "project_name" {
  default = "roboshop"
}


variable "sg_description" {
  default = "allowing all ports from my home IP address"
}

variable "env" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "Roboshop"
    Component = "VPN"
    Environment = "DEV"
    Terraform = true
  }
}

variable "sg_tags" {
  default = {
    Name = "Roboshop"
  }
}