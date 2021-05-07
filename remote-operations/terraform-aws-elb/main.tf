# Loadbalancer Digital OnUs Demo
resource "aws_elb" "digital_elb" {
  name = "digital-elb"

  subnets         = [var.digital_subnet_id]
  security_groups = [var.digital_elb_sg_id]
  instances       = [for key, instance in var.digital_ec2_instances : instance]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}