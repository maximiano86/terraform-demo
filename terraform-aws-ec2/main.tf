# Digital EC2 instance 1 demo
resource "aws_instance" "digital_ec2_one_demo" {

  instance_type          = "t2.micro"
  subnet_id              = var.digital_subnet_id
  ami                    = var.digital_ami_id
  vpc_security_group_ids = [var.digital_ec2_sg_id]
  user_data              = <<-EOF
	      #!/bin/bash
		    sudo yum update -y
		    sudo yum install httpd -y
		    sudo systemctl start httpd
        sudo systemctl enable httpd
		    sudo echo digital_ec2_one_demo > /var/www/html/index.html
		    EOF

  tags = {
    Name = "Digital EC2 instance 1 demo"
  }

}

# Digital EC2 instance 2 demo
resource "aws_instance" "digital_ec2_two_demo" {

  instance_type          = "t2.micro"
  subnet_id              = var.digital_subnet_id
  ami                    = var.digital_ami_id
  vpc_security_group_ids = [var.digital_ec2_sg_id]
  user_data              = <<-EOF
	      #!/bin/bash
		    sudo yum update -y
		    sudo yum install httpd -y
		    sudo systemctl start httpd
        sudo systemctl enable httpd
		    sudo echo digital_ec2_two_demo > /var/www/html/index.html
		    EOF

  tags = {
    Name = "Digital EC2 instance 2 demo"
  }

}