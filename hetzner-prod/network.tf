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

# Hashicorp docs: https://www.consul.io/docs/install/ports
resource "hcloud_firewall" "allow-consul" {
  name = "allow-consul"
  /*
  ports list:
  8600 TCP&UDP - Consul DNS
  8500/TCP - http API
  8301/TCP - LAN Serf
  8302/TCP - WAN Serf (still needs to be there on LAN)
  21000-21255/both - used for sidecars, will leave this blocked for now
  */
  rule {
    direction = "in"
    protocol  = "udp"
    port      = "8600"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8302"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8301"
    source_ips = [
      "10.0.0.0/24"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8500"
    source_ips = [
      "10.0.0.0/24"
    ]
  }
}


resource "hcloud_firewall" "allow-consul-server" {
  name = "allow-consul-server"
  /*
  ports list:
  8300/TCP - RPC for the consul server
  */

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8300"
    source_ips = [
      "10.0.0.0/24"
    ]
  }


}

