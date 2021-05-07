# Digital ELB dns
output "address" {
  value = aws_elb.digital_elb.dns_name
}