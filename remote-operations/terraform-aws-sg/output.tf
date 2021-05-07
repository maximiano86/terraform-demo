# VPC demo id
output "sg_elb" {
  value = aws_security_group.digital_sg_elb_demo.id
}

# VPC igw id
output "sg_ec2" {
  value = aws_security_group.digital_sg_ec2_demo.id
}