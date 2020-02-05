provider "aws" {
    profile = "default"
    region  = var.aws_region
}

resource "aws_route53_record" "hostname" {
  zone_id = var.aws_zoneid
  name    = var.hostname
  type    = "A"
  ttl     = "300"
  records = [var.public_ip]
}

variable "aws_zoneid" {
    description = "Zone ID for update on Route 53"
}

variable "hostname" {
    description = "Hostname to modify"
}

variable "public_ip" {
    description = "Public IP"
}


