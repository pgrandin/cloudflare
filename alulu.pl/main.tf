terraform {
  backend "s3" {
    bucket = "pierre-infrastructure"
    key    = "cloudflare/alulu.pl"
    region = "us-west-2"
  }
}

module "bare" {
  source         = "../baredomain"
  domain         = "alulu.pl"
  main_server_ip = "212.83.143.34"
  www_ip         = "212.83.143.34"
}

resource "cloudflare_record" "microsoft" {
  domain = "${var.domain}"
  name   = "@"
  value  = "MS=ms95096355"
  type   = "TXT"
  ttl    = 1
}
