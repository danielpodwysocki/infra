terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.33.2"
    }
  }
  cloud {
    organization = "dapo_tech"

    workspaces {
      name = "hetzner-dev"
    }
  }
}

variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "The Hetzner Cloud API token"
}


provider "hcloud" {
  # Configuration options
  token = var.hcloud_token

}

