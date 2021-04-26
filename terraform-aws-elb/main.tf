# Loadbalancer Digital OnUs Demo
resource "aws_elb" "digital_elb" {
  name = "digital-elb"

  subnets         = [var.digital_subnet_id]
  security_groups = [var.digital_ec2_sg_id]
  instances       = [var.digital_ec2_one, var.digital_ec2_two]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}