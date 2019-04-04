terraform {
  backend "s3" {
    bucket = "pierre-infrastructure"
    key    = "cloudflare/madejstudio.pl"
    region = "us-west-2"
  }
}

module "bare" {
  source         = "../baredomain"
  domain         = "madejstudio.com"
  main_server_ip = "212.83.143.34"
  www_ip         = "212.83.143.34"
}
