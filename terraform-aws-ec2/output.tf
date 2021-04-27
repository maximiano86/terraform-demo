# EC2 instance id
output "ec2_id" {
  value = aws_instance.digital_ec2_demo.id
}
