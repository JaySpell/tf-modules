resource "aws_security_group" "allow_srv" {
  name        = "allow_srv"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpcid
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # add a CIDR block here
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

variable "from_port" {
    description = "Ingress from port"
}

variable "to_port" {
    description = "Ingress to port"
}

variable "vpcid" {
    description = "AWS VPC ID"
}

variable "cidr_block" {
    description = "AWS cidr block"
}