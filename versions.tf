terraform {
  required_version = ">= 0.13.1"

  required_providers {
    ultradns = {
      source  = "ultradns/ultradns"
      version = ">= 1.6.1"
    }
  }
}

provider "ultradns" {
  username = var.ultradns_username
  password = var.ultradns_password
  hosturl  = var.ultradns_host_url
}
