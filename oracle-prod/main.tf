terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.60.0"
    }
  }
}

provider "oci" {
  region = var.region
}

