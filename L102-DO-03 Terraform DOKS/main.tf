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
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
    node_count = 1
  }
}
