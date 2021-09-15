terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "myjobplanner"

    # The prefix of the Terraform Cloud workspace to store Terraform state files in.
    # Name is set by TF_WORKSPACE environment variable
    workspaces {
      prefix = "myjobplanner-"
    }
  }
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
