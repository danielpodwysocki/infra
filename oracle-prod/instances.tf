resource "oci_core_instance" "pyrokar" {
  display_name        = "pyrokar"
  availability_domain = oci_core_subnet.production-a.availability_domain
  compartment_id      = oci_identity_compartment.production.id
  shape               = "VM.Standard.E2.1.Micro"
  agent_config {
    are_all_plugins_disabled = true
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.production-a.id
    nsg_ids = [
      oci_core_network_security_group.allow_ssh.id,
    ]
  }
  source_details {
    source_type = "image"
    source_id   = var.linux_generic_image_id
  }
  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

