resource "aws_route53_zone" "dev_private" {
  name          = "dev.dapo.tech"
  force_destroy = true

  vpc {
    vpc_id = aws_vpc.dev.id
  }

  tags = {
    Name = "dev.dapo.tech"
    Env  = "dev"
  }
}


resource "aws_route53_record" "vault" {
  zone_id = aws_route53_zone.dev_private.zone_id
  name    = "vault.dev.dapo.tech"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.vault1.private_ip]
}

