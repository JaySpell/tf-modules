resource "aws_route53_record" "hostname" {
  zone_id = var.zoneid
  name    = var.hostname
  type    = "A"
  ttl     = "300"
  records = [var.public_ip]
}

variable "zoneid" {
    description = "Zone ID for update on Route 53"
}

variable "hostname" {
    description = "Hostname to modify"
}

variable "public_ip" {
    description = "Public IP"
}
