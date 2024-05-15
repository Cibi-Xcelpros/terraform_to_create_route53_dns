provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_route53_record" "a_record" {
  zone_id = var.aws_zoneid
  name    = var.sub_domain_name
  type    = "A"
  ttl     = "300"
  records = ["20.118.207.176"]
}
