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


resource "digitalocean_kubernetes_cluster" "dokslab" {
  name    = "dokslab"
  region  = "nyc1"
  version = ""
  auto_upgrade = true

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}
