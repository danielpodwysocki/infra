resource "oci_core_vcn" "production_vcn" {
  compartment_id = oci_identity_compartment.production.id

  display_name = "production_vcn"
  cidr_blocks = [
    "10.0.1.0/24",
  ]

}

resource "oci_core_default_route_table" "production_route_table" {
  manage_default_resource_id = oci_core_vcn.production_vcn.default_route_table_id
  compartment_id             = oci_identity_compartment.production.id
  route_rules {
    network_entity_id = oci_core_internet_gateway.production_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

}

resource "oci_core_subnet" "production-a" {
  availability_domain = var.availability-domain-a
  vcn_id              = oci_core_vcn.production_vcn.id
  compartment_id      = oci_identity_compartment.production.id
  cidr_block          = var.cidr_block-a

  display_name = "production-a"
}

resource "oci_core_subnet" "production-b" {
  availability_domain = var.availability-domain-b
  vcn_id              = oci_core_vcn.production_vcn.id
  compartment_id      = oci_identity_compartment.production.id
  cidr_block          = var.cidr_block-b

  display_name = "production-b"
}

resource "oci_core_internet_gateway" "production_gateway" {
  compartment_id = oci_identity_compartment.production.id
  vcn_id         = oci_core_vcn.production_vcn.id

  enabled      = true
  display_name = "production_gateway"
}


resource "oci_core_network_security_group" "allow_ssh" {
  compartment_id = oci_identity_compartment.production.id
  vcn_id         = oci_core_vcn.production_vcn.id

  display_name = "allow_ssh"
}


resource "oci_core_network_security_group_security_rule" "allow_ssh-allow_ssh" {
  #Required
  network_security_group_id = oci_core_network_security_group.allow_ssh.id
  direction                 = "INGRESS"
  protocol                  = "6" #TCP IANA protocol number
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

