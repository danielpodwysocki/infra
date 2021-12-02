terraform {
  required_version = ">= 1.0.11"
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.32.1"
    }
  }
}

variable hcloud_token {
  type        = string
  sensitive   = true
  description = "The Hetzner Cloud API token"
}


provider "hcloud" {
  # Configuration options
  token = var.hcloud_token

}
