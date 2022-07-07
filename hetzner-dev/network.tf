resource "hcloud_network" "hcloud-network" {
  name     = "hcloud-network"
  ip_range = "172.21.0.0/16"
}

resource "hcloud_network_subnet" "hcloud-network-subnet-1" {
  type         = "cloud"
  network_id   = hcloud_network.hcloud-network.id
  network_zone = "eu-central"
  ip_range     = "172.21.0.0/24"
}


resource "hcloud_firewall" "allow-ssh" {
  name = "allow-ssh"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}


resource "hcloud_firewall" "allow-consul-server" {
  name = "allow-consul-server"
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8300"
    source_ips = [
      "172.21.0.0/16"
    ]
  }

}

