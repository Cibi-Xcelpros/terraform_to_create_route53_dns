provider "aws" {
  region = "us-east-1"
}

resource "aws_route53_record" "a_record" {
  # zone_id = aws_route53_zone.dns.zone_id
  zone_id = var.aws_zoneid
  name    = var.sub_domain_name
  type    = "A"
  ttl     = "300"
  records = [var.nginx_server_ip]
}
