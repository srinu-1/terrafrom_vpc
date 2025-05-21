# Security Group for Public Instances
resource "aws_security_group" "public" {
  name        = local.public_sg_name
  description = "Security group for public instances"
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    from_port   = local.ports.ssh
    to_port     = local.ports.ssh
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port   = local.ports.http
    to_port     = local.ports.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Application ports
  ingress {
    from_port   = local.ports.app1
    to_port     = local.ports.app1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = local.ports.app2
    to_port     = local.ports.app2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.security_tags,
    {
      Name        = local.public_sg_name
      Environment = var.environment
    }
  )
}

# Security Group for Private Instances
resource "aws_security_group" "private" {
  name        = local.private_sg_name
  description = "Security group for private instances"
  vpc_id      = var.vpc_id

  # Allow inbound traffic from public security group
  ingress {
    from_port       = local.ports.app1
    to_port         = local.ports.app1
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  ingress {
    from_port       = local.ports.app2
    to_port         = local.ports.app2
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.security_tags,
    {
      Name        = local.private_sg_name
      Environment = var.environment
    }
  )
}
