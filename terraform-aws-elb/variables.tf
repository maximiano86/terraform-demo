variable "digital_subnet_id" {
  type = string
}

variable "digital_elb_sg_id" {
  type = string
}

variable "digital_ec2_instances" {
  type = list(string)
}
