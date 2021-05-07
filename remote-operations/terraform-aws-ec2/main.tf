# Digital EC2 instance 1 demo
resource "aws_instance" "digital_ec2_demo" {

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
        sudo echo "Hostname: $(hostname)" >> /var/www/html/index.html
        EOF

  tags = {
    Name = var.ec2_name
  }

  #  connection {
  #    type        = "ssh"
  #    user        = "ec2-user"
  #    host        = self.public_ip
  #    private_key = file(var.private_key)
  #  }
  #
  #  instance_type          = "t2.micro"
  #  subnet_id              = var.digital_subnet_id
  #  ami                    = var.digital_ami_id
  #  vpc_security_group_ids = [var.digital_ec2_sg_id]
  #
  #  provisioner "remote-exec" {
  #    inline = [
  #      "yum update -y",
  #      "yum install httpd -y",
  #      "systemctl start httpd",
  #      "systemctl enable httpd",
  #      "sudo echo "Hostname: $(hostname)" >> /var/www/html/index.html"
  #    ]
  #  }  
}