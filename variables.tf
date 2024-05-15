# variable "nginx_server_ip" {
#   description = "Enter the ip address of nginx server"
#   type        = string
# }

variable "sub_domain_name" {
  description = "Enter the your desired subdomain add, Will produce <subdomain>.weberp.xcelpros.com"
  type        = string
}

variable "aws_zoneid" {
  description = "Enter the zone id of the route53 hosing"
  type        = string
}
variable "aws_access_key" {
  description = "Enter the aws_access_key to access route53 hosing"
  type = string
}
variable "aws_secret_key" {
  description = "Enter the aws_secret_key to access route53 hosing"
  type = string
}
variable "aws_region" {
  description = "Enter the region where the route53 is hosted"
  type = string
}