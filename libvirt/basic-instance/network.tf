resource "libvirt_network" "instance-network" {
  name      = "almalinux"
  mode      = "nat"
  domain    = "itsimplenow.local"
  addresses = ["172.100.100.100/24"]
  autostart = true
  dns {
    enabled = true
  }
}