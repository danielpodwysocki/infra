resource "hcloud_server" "xardas" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]
  
  labels = {
    // consul-servers = "group"
    // nomad-servers = "group"
    // vault-servers = "group"
    swarm-managers = "group"

  }

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.10"

  }
  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
    hcloud_firewall.allow-swarm.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}

resource "hcloud_volume" "xardas_data" {
  name              = "xardas_data"
  linux_device      = "/dev/xardas_data"
  size              = 10
  server_id         = hcloud_server.node1.id
  automount         = true
  format            = "ext4"
  delete_protection = false

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
    hcloud_firewall.allow-swarm.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}

