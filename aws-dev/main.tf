terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
  backend "s3" {
    bucket = "terraform-20220101095813227800000001"
    key    = "aws-dev"
    region = "eu-central-1"
  }

}


variable "ssh_key_name" {
  default = "aws-daniel-macbook"
}

variable "region" {
  default = "eu-central-1"
}

variable "env" {
  default = "dev"
}

provider "aws" {
  region = var.region
}
