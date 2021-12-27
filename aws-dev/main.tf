terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

variable "ssh_key_name" {
  default = "aws-daniel-macbook"
}
