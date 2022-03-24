terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.18.0"
    }
  }
  cloud {
    organization = ""

    workspaces {
      name = ""
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_droplet" "mydroplet" {
  image  = "ubuntu-21-10-x64"
  name   = var.droplet_name
  region = var.region
  size   = "s-1vcpu-1gb"
}

output "droplet_ip_address" {
  value = digitalocean_droplet.mydroplet.ipv4_address
}
