resource "hcloud_server" "xardas" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  
  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.1"

  }

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}


