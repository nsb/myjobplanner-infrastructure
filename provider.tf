terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    auth0 = {
      source  = "alexkappa/auth0"
      version = "~> 0.21"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "X1"
}

provider "auth0" {}
