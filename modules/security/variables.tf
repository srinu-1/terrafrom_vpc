variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, qa, prod)"
  type        = string
}

variable "security_tags" {
  description = "Additional tags for security resources"
  type        = map(string)
  default     = {}
}
