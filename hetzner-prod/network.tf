resource "hcloud_network" "hzcloud-network" {
  name         = "hzcloud-network"
  ip_range     = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "hzcloud-network-subnet-1" {
  type         = "cloud"
  network_id   = hcloud_network.hzcloud-network.id
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/24"
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

resource "hcloud_firewall" "allow-swarm" {
  name = "allow-swarm"
  /*
  ports list:
  2377/TCP - the API
  7949/both - discovery and gossip between nodes
  4789/udp - overlay network
  esp - required for encrypted mode
  */

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "2377"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "7949"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "7949"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "4789"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "esp"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

}

