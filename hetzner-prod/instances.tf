resource "hcloud_server" "xardas" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx31"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]


  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.10"
  }

  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
    hcloud_firewall.allow-web-all.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1,
  ]

}

resource "hcloud_volume" "xardas_data" {
  name      = "xardas_data"
  size      = 10
  server_id = hcloud_server.xardas.id

}

