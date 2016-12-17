resource "aws_route53_record" "main" {
  zone_id = "${var.hosted_zone_id}"
  name = "${var.domain_name}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.webserver.*.public_ip}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${var.hosted_zone_id}"
  name = "www.${var.domain_name}"
  type = "CNAME"
  ttl = "300"
  records = ["${var.domain_name}"]
}
