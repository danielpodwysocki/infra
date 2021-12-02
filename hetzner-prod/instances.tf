resource "hcloud_server" "kube01" {
  name        = "kube01"
  image       = "rocky-8"
  server_type = "cpx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  
}
