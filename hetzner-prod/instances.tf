resource "hcloud_server" "xardas" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  
  labels = {
    consul-servers = "group"
    nomad-servers = "group"
    vault-servers = "group"

  }

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.10"

  }
  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
    hcloud_firewall.allow-consul.id,
    hcloud_firewall.allow-consul-server.id,
    hcloud_firewall.allow-nomad.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}


resource "hcloud_server" "docker01" {
  name        = "docker01"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.11"

  }
  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
    hcloud_firewall.allow-consul.id,
    hcloud_firewall.allow-nomad.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}

