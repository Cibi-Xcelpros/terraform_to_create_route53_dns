variable "nginx_server_ip" {
  description = "Enter the ip address of nginx server"
  type        = string
}

variable "sub_domain_name" {
  description = "Enter the your desired subdomain add, Will produce <subdomain>.weberp.xcelpros.com"
  type        = string
}

variable "aws_zoneid" {
  description = "Enter the zone id of the route53 hosing"
  type        = string
}
