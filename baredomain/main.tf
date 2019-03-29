resource "cloudflare_record" "root" {
  domain = "${var.domain}"
  name   = "${var.domain}"
  value  = "www.${var.domain}"
  type   = "CNAME"
  proxied = "true"
  ttl    = 1
}

resource "cloudflare_record" "www" {
  domain = "${var.domain}"
  name   = "www"
  value  = "${var.www_ip}"
  type   = "A"
  proxied = "true"
  ttl    = 1
}

resource "cloudflare_record" "mail" {
  domain = "${var.domain}"
  name   = "mail"
  value  = "${var.main_server_ip}"
  type   = "A"
  proxied = "false"
  ttl    = 1
}

resource "cloudflare_record" "mx01" {
  domain = "${var.domain}"
  name   = "mx01"
  value  = "${var.main_server_ip}"
  type   = "A"
  proxied = "true"
  ttl    = 1
}

resource "cloudflare_record" "mx" {
  domain = "${var.domain}"
  name   = "${var.domain}"
  value  = "mx01.${var.domain}"
  type   = "MX"
  ttl    = 600
}

resource "cloudflare_record" "_dmarc" {
  domain = "${var.domain}"
  name   = "_dmarc"
  value  = "v=DMARC1; p=none; rua=mailto:postmaster@${var.domain};"
  type   = "TXT"
  ttl    = 1
}

resource "cloudflare_record" "spf" {
  domain = "${var.domain}"
  name   = "${var.domain}"
  value  = "v=spf1 a mx -all"
  type   = "TXT"
  ttl    = 1
}
