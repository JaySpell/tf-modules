resource "aws_route53_zone" "dnszone" {
    name = var.dnszone
}

resource "aws_route53_record" "default" {
  zone_id = aws_route53_zone.dnszone.zone_id
  name    = var.hostname
  type    = "A"
  ttl     = "300"
  records = [var.public_ip]
}

variable "dnszone" {
    description = "Zone ID for update on Route 53"
}

variable "hostname" {
    description = "Hostname to modify"
}

variable "public_ip" {
    description = "Public IP"
}
