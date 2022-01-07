resource "hcloud_server" "xardas" {
  name               = "xardas"
  image              = "rocky-8"
  server_type        = "cpx21"
  location           = "fsn1"
  ssh_keys           = ["daniel@Daniels-MBP"]
  

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
    hcloud_firewall.allow-kube-api-all.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1,
  ]

}

resource "hcloud_volume" "xardas_data" {
  name              = "xardas_data"
  size              = 10
  server_id         = hcloud_server.xardas.id

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

resource "hcloud_volume" "node01_data" {
  name              = "node01_data"
  size              = 10
  server_id         = hcloud_server.node01.id

}


resource "hcloud_server" "node02" {
  name        = "node02"
  image       = "rocky-8"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = ["daniel@Daniels-MBP"]

  labels = {
    k3s = "group"
  }
  

  

  network {
    network_id = hcloud_network.hzcloud-network.id
    ip         = "10.0.0.12"

  }
  firewall_ids = [
    hcloud_firewall.allow-ssh.id,
  ]

  depends_on = [
    hcloud_network_subnet.hzcloud-network-subnet-1
  ]

}
