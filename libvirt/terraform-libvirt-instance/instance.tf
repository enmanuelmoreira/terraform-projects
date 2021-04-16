resource "libvirt_volume" "instance-disks" {
  count          = var.instance
  name           = "instance${count.index}.qcow2"
  base_volume_id = libvirt_volume.os.id
  pool           = "vm"
  format         = "qcow2"
  size           = var.disk_size
}

resource "libvirt_domain" "instance" {
  count  = var.instance
  name   = "instance${count.index}"
  memory = var.instance_memory
  vcpu   = var.instance_vcpu
  cpu = {
    mode = "host-passthrough"
  }

  autostart = false

  disk {
    volume_id = element(libvirt_volume.instance-disks.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    hostname     = "instance${count.index}"
    network_name = "lab"
    network_id   = libvirt_network.lab-network.id
    addresses = ["172.10.10.10${count.index}"]
  }
}