resource "libvirt_network" "lab-network" {
  name      = "lab"
  mode      = "nat"
  domain    = "lab.local"
  addresses = ["172.10.10.0/24"]
  autostart = true
  dns {
    enabled = true
  }
}