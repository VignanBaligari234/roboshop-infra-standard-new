terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "roboshop-remote-state-bucket-new"
    key = "payment"
    region = "us-east-1"
    dynamodb_table = "roboshop-lock"
    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}