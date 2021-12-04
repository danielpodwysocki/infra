resource "hcloud_server" "kube01" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  
}
