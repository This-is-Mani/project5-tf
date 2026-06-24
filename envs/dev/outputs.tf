output "dev_instance_id" {
  value = module.ec2.instance_id
}

output "dev_public_ip" {
  value = module.ec2.public_ip
}
