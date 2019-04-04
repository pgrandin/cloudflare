terraform {
  backend "s3" {
    bucket = "pierre-infrastructure"
    key    = "cloudflare/brainstorm.im"
    region = "us-west-2"
  }
}

module "bare" {
  source         = "../baredomain"
  domain         = "${var.domain}"
  main_server_ip = "${var.main_server_ip}"
  www_ip         = "${var.main_server_ip}"
}

resource "cloudflare_record" "irc" {
  domain  = "${var.domain}"
  name    = "irc"
  value   = "${var.main_server_ip}"
  type    = "A"
  proxied = "true"
  ttl     = 1
}
