# Local variables
locals {
  common_ports = [80, 443]
}

# Allow access to ELB from the Internet
resource "aws_security_group" "digital_sg_elb_demo" {
  name   = "digital_sg_elb_demo"
  vpc_id = var.digital_vpc_id

  # Allow Common Ports from anywhere
  dynamic "ingress" {
    for_each = local.common_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Access to internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# For SSH and HTTP
resource "aws_security_group" "digital_sg_ec2_demo" {
  name   = "digital_sg_ec2_demo"
  vpc_id = var.digital_vpc_id

  # Allow Common Ports from anywhere
  dynamic "ingress" {
    for_each = local.common_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      # cidr_blocks = ["10.0.0.0/16"] only from private subnet
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Access to internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}