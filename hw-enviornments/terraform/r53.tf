resource "aws_route53_zone" "dl" {
  name = "dl.broadwing.io"

  tags = {
    Environment = "demo"
  }
}

resource "aws_route53_record" "hwdemo" {
  zone_id = aws_route53_zone.dl.zone_id
  name    = "demo.dl.broadwing.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["bwdemo.broadwing.io"]
}