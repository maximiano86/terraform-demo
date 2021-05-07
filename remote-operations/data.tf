data "aws_ami" "ec2_image" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "image-id"
    values = ["ami-0533f2ba8a1995cf9"]
  }
}