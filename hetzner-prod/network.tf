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


