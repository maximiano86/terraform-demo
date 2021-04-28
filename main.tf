# AWS Terraform provider version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# AWS Provider
provider "aws" {
  region = var.aws_region
  # export AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY
  # RUN aws configure
}

# Create Network infra
module "networking" {
  source      = "./terraform-aws-networking"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

# Create SG
module "security_groups" {
  source         = "./terraform-aws-sg"
  digital_vpc_id = module.networking.vpc_demo
}

# Create EC2 instances 
module "ec2_instances" {
  source            = "./terraform-aws-ec2"
  count = var.ec2_number
  digital_subnet_id = module.networking.subnet_demo
  digital_ec2_sg_id = module.security_groups.sg_ec2
  ec2_name          = "Digital EC2 Demo ${count.index}"
}

# Create ELB
module "elb" {
  source                = "./terraform-aws-elb"
  digital_subnet_id     = module.networking.subnet_demo
  digital_elb_sg_id     = module.security_groups.sg_elb
  digital_ec2_instances = [for key, instance in module.ec2_instances : instance.ec2_id]
}