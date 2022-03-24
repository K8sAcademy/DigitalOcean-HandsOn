terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.18.0"
    }
  }
}

provider "digitalocean" {
  token = ""
}

data "digitalocean_kubernetes_cluster" "example" {
  name = "dokslab"
}


