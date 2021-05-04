# Region to work with
variable "aws_region" {
  description = "AWS Regin to work with"
  type = map
  default     = {
    "us-one" = "us-east-1"
    "us-two" = "us-east-2"
  }
}

# Number of EC2 instances
variable "ec2_number" {
  default = 2
}