# Base image
variable "digital_ami_id" {
  description = "Amazon Linux 2 base image"
  default     = "ami-0533f2ba8a1995cf9"
}

# Subnet ID from netwroking module
variable "digital_subnet_id" {
  type = string
}

# SG ID from security-group module
variable "digital_ec2_sg_id" {
  type = string
}