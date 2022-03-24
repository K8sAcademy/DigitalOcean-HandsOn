terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.18.0"
    }
  }
  backend "s3" {
    access_key                  = ""
    secret_key                  = ""
    endpoint                    = "https://[region].digitaloceanspaces.com" // your endpoint
    bucket                      = ""                              // name of your space
    key                         = "lab/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    region                      = "us-east-1"
  }
}

provider "digitalocean" {
  token = ""
}


resource "digitalocean_droplet" "mydroplet" {
  image  = "ubuntu-21-10-x64"
  name   = "web-1"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

output "droplet_ip_address" {
  value = digitalocean_droplet.mydroplet.ipv4_address
}
