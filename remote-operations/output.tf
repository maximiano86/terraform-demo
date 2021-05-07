# Digital ELB dns
output "digital_elb_dns" {
  value = module.elb.address
}