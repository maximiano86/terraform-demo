# Region to work with
variable "aws_region" {
  description = "AWS Regin to work with"
  default     = "us-east-1"
}

# Number of EC2 instances
variable "ec2_number" {
  default = 2
}