locals {
  name_prefix = "${var.environment}"

  # Security group names
  public_sg_name  = "${local.name_prefix}-public-sg"
  private_sg_name = "${local.name_prefix}-private-sg"

  # Common ports
  ports = {
    ssh    = 22
    http   = 8080
    app1   = 3000
    app2   = 8000
  }
}   