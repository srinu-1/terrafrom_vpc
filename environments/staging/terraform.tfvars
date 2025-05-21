environment = "staging"
aws_region  = "us-east-1"
vpc_cidr    = "10.1.0.0/16"  # Staging VPC CIDR

# VPC Settings
enable_dns_hostnames = true
enable_dns_support   = true
instance_tenancy     = "default"

vpc_tags = {
  Environment = "staging"
  Project     = "Custom-VPC"
  Owner       = "DevOps"
} 