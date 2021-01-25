variable "region" {
  default = "eu-west-1"
}


variable "public_hosted_zone_id" {
  description = "ID of the Public Hosted Zone"
  type        = string
  sensitive   = true
  default = "Z01721142YH3G3KSY0SJJ"
}


variable "private_certificate_arn" {
  description = "ARN of the private certificate issued by AWS Certificate Manager"
  type        = string
  sensitive   = true
  default = "arn:aws:acm:us-east-1:218153901974:certificate/e93b7027-a151-4f63-a8f1-fafdae13a93c"
}
