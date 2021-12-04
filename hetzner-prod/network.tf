resource "hcloud_network" "hzcloud-network" {
  name     = "hzcloud-network"
  ip_range = "10.0.0.0/24"
}

