output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
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