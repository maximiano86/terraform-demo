# VPC demo id
output "vpc_demo" {
  value = aws_vpc.digital_vpc_demo.id
}

# VPC igw id
output "internet_gateway_demo" {
  value = aws_internet_gateway.digital_internet_gateway_demo.id
}

# VPC rt id
output "rt_demo" {
  value = aws_route.digital_rt_demo.id
}

# VPC subnet id
output "subnet_demo" {
  value = aws_subnet.digital_subnet_demo.id
}