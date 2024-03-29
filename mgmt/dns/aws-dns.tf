provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_route53_record" "default" {
  zone_id           = var.zoneid
  name              = var.hostname
  type              = "A"
  ttl               = "10"
  records           = [var.public_ip]
  allow_overwrite   = true
}

resource "aws_route53_record" "cname" {
  zone_id           = var.zoneid
  name              = var.hostname
  type              = "CNAME"
  ttl               = "10"
  records           = [var.arecord]
  allow_overwrite   = true
}

variable "zoneid" {
    description = "Zone ID for update on Route 53"
    default     = ""
}

variable "hostname" {
    description = "Hostname to modify"
}

variable "public_ip" {
    description = "Public IP"
}
