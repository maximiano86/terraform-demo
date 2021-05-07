# VPC Digital OnUs Demo
resource "aws_vpc" "digital_vpc_demo" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Digital VPC Demo"
  }
}

# Interget Gateway for Digital OnUs Demo
resource "aws_internet_gateway" "digital_internet_gateway_demo" {
  vpc_id = aws_vpc.digital_vpc_demo.id

  tags = {
    Name = "Digital IGW Demo"
  }

  #depends_on = [aws_vpc.digital_vpc_demo]

}

# Routing Table for Digital OnUs Demo
resource "aws_route" "digital_rt_demo" {
  route_table_id         = aws_vpc.digital_vpc_demo.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.digital_internet_gateway_demo.id
}

# Subnet Digital OnUs Demo
resource "aws_subnet" "digital_subnet_demo" {
  vpc_id                  = aws_vpc.digital_vpc_demo.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Digital Subnet Demo"
  }
}