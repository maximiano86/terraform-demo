# EC2 1 instance id
output ec2_one {
    value =aws_instance.digital_ec2_one_demo.id
}

# EC2 2 instance id
output ec2_two {
    value =aws_instance.digital_ec2_two_demo.id
}