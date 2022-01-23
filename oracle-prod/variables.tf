# The region to deploy to

variable "region" {
  default = "eu-frankfurt-1"
}

# Availabilty domains - those will be used to create two subnets and deploy instances in them

variable "availability-domain-a" {
  default = "neSS:EU-FRANKFURT-1-AD-1"
}

variable "availability-domain-b" {
  default = "neSS:EU-FRANKFURT-1-AD-2"
}

variable "cidr_block-a" {
  default = "10.0.1.0/26"
}

variable "cidr_block-b" {
  default = "10.0.1.64/26"
}



# all generic linux machines will get this image
variable "linux_generic_image_id" {
  # Oracle Linux 8, build 2021.12.08-0
  default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"

}

variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

# functions cannot be used in input variables,
# therefore we need to use a local var
locals {
  ssh_public_key = file("${var.ssh_public_key_path}")
}
