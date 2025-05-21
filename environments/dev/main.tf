provider "aws" {
  region = var.aws_region
}

locals {
  azs = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c", "${var.aws_region}d"]
  
  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
    }
  )
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"
  
  environment         = var.environment
  vpc_cidr           = var.vpc_cidr
  aws_region         = var.aws_region
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  instance_tenancy     = var.instance_tenancy
  vpc_tags           = local.common_tags
}

# Network Module
module "network" {
  source = "../../modules/network"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  azs         = local.azs
  vpc_cidr    = var.vpc_cidr
  network_tags = local.common_tags
}

# Security Module
module "security" {
  source = "../../modules/security"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  security_tags = local.common_tags
} 