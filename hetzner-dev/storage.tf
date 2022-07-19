resource "hcloud_volume" "xardas_storage" {
  name     = "xardas_vol1"
  size     = 10
  location = "fsn1"
  count    = 1

}

resource "hcloud_volume_attachment" "xardas_storage" {
  volume_id = hcloud_volume.xardas_storage[0].id
  server_id = hcloud_server.xardas[0].id
  count     = var.deploy ? 1 : 0
  automount = false
}

