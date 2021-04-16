resource "libvirt_network" "kubernetes-network" {
  name      = "kubernetes"
  mode      = "nat"
  domain    = "itsimplenow.local"
  addresses = ["172.10.10.0/24"]
  autostart = true
  dns {
    enabled = true
  }
}