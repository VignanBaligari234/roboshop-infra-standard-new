variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "Roboshop"
   # Component = "firewalls"
    Environment = "DEV"
    Terraform = true
  }
}

