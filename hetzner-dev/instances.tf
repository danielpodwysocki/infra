resource "hcloud_server" "xardas" {
  name        = "xardas"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel_mbp"]


  network {
    network_id = hcloud_network.hcloud-network.id
    ip         = "172.21.0.10"
  }

  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
    hcloud_firewall.allow-consul-server.id,
  ]

  depends_on = [
    hcloud_network_subnet.hcloud-network-subnet-1,
  ]
  labels = {
    group = "xardas"
  }

}

resource "hcloud_server" "lester" {
  name        = "lester"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel_mbp"]


  network {
    network_id = hcloud_network.hcloud-network.id
    ip         = "172.21.0.11"
  }

  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
  ]

  depends_on = [
    hcloud_network_subnet.hcloud-network-subnet-1,
  ]
  labels = {
    group = "lester"
  }

}

