output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "nat_gateway_ip" {
  value = module.network.nat_gateway_ip
}

output "public_security_group_id" {
  value = module.security.public_security_group_id
}

output "private_security_group_id" {
  value = module.security.private_security_group_id
} 