resource "hcloud_server" "xardas" {
  name               = "xardas"
  image              = "rocky-8"
  server_type        = "cx11"
  location           = "fsn1"
  ssh_keys           = ["daniel@Daniels-MBP"]
  delete_protection  = true
  rebuild_protection = true
  

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.10"
  }

  labels = {
    k3s_server = "group",
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
  name              = "xardas_data"
  size              = 10
  server_id         = hcloud_server.xardas.id
  delete_protection = true

}



resource "hcloud_server" "node01" {
  name        = "node01"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]

  labels = {
    k3s = "group"
  }
  

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.11"

  }
  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}

