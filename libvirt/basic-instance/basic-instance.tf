resource "libvirt_volume" "almalinux8-qcow2" {
  name           = "almalinux8.qcow2"
  base_volume_id = libvirt_volume.almalinux8.id
  pool           = "vm"
  format         = "qcow2"
  size           = var.disk_size
}

resource "libvirt_domain" "basic-instance" {
  name   = "almalinux8"
  memory = var.instance_memory
  vcpu   = var.vcpu
  cpu = {
    mode = "host-passthrough"
  }

  autostart = false

  disk {
    volume_id = libvirt_volume.almalinux8-qcow2.id
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    hostname     = "instance"
    network_name = "almalinux"
    network_id   = libvirt_network.instance-network.id
    addresses    = ["172.100.100.101"]
  }
}

output "IP" {
  value = libvirt_domain.basic-instance.*.network_interface.0.addresses
}
