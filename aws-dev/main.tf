terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}


variable "ssh_key_name" {
  default = "aws-daniel-macbook"
}

variable "region" {
  default = "eu-central-1"
}

provider "aws" {
  region = var.region
}
