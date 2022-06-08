terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.33.2"
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

