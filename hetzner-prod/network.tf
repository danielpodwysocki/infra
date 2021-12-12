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


resource "hcloud_firewall" "allow-web-all" {
  name = "allow-web-all"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}

resource "hcloud_firewall" "allow-kube-api-all" {
  name = "allow-kube-api-all"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "6443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}


resource "hcloud_firewall" "allow-kube-api-private" {
  name = "allow-kube-api-private"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "6443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}


