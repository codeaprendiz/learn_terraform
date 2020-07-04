//resource "aws_route53_zone" "devops-academy" {
//  name = "devops.academy"
//}
//
//resource "aws_route53_record" "server1-record" {
//  zone_id = aws_route53_zone.devops-academy.zone_id
//  name    = "server1.devops.academy"
//  type    = "A"
//  ttl     = "300"
//  records = ["92.97.88.125"]
//}
//
//
//output "ns-servers" {
//  value = aws_route53_zone.devops-academy.name_servers
//}
//
