data "oci_identity_compartment" "root_compartment" {
  id = "ocid1.tenancy.oc1..aaaaaaaacadu5tvyyvc27k73fbk7auybah4l3ez2xuneussp3nick7ttpyvq"

}

resource "oci_identity_compartment" "production" {
  compartment_id = data.oci_identity_compartment.root_compartment.id
  description    = "Production compartment"
  name           = "production"

}

