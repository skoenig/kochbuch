terraform {
  required_providers {
    hetznerdns = {
      source  = "germanbrew/hetznerdns"
      version = "3.4.0"
    }
  }
  required_version = ">= 1.0"
}

variable "hetznerdns_token" {}

provider "hetznerdns" {
  api_token = var.hetznerdns_token
}

resource "hetznerdns_zone" "dns_zone" {
  name = "einfachsatt.de"
  ttl  = 7200
}

data "hetznerdns_nameservers" "primary" {}

resource "hetznerdns_record" "einfachsatt-de_NS" {
  for_each = toset(data.hetznerdns_nameservers.primary.ns.*.name)

  zone_id = hetznerdns_zone.dns_zone.id
  type    = "NS"
  name    = "@"
  value   = each.value
}

resource "hetznerdns_record" "hetzner_txt" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 +a +mx ?all"
}

resource "hetznerdns_record" "github_1" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "A"
  name    = "@"
  value   = "185.199.108.153"
}

resource "hetznerdns_record" "github_2" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "A"
  name    = "@"
  value   = "185.199.109.153"
}

resource "hetznerdns_record" "github_3" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "A"
  name    = "@"
  value   = "185.199.110.153"
}

resource "hetznerdns_record" "github_4" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "A"
  name    = "@"
  value   = "185.199.111.153"
}

resource "hetznerdns_record" "github_cname" {
  zone_id = hetznerdns_zone.dns_zone.id
  type    = "CNAME"
  name    = "www"
  value   = "skoenig.github.io."
}
