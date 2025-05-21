# VPC Information
output "vpc_id" {
  description = "The ID of the QA VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the QA VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_arn" {
  description = "The ARN of the QA VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_default_security_group_id" {
  description = "The ID of the default security group in the QA VPC"
  value       = module.vpc.vpc_default_security_group_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "nat_gateway_ip" {
  description = "Elastic IP of NAT Gateway"
  value       = module.network.nat_gateway_ip
}

output "public_security_group_id" {
  description = "ID of the public security group"
  value       = module.security.public_security_group_id
}

output "private_security_group_id" {
  description = "ID of the private security group"
  value       = module.security.private_security_group_id
} 