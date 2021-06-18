resource "libvirt_volume" "workers-disks" {
  count          = var.workers
  name           = "node${count.index}.qcow2"
  base_volume_id = libvirt_volume.os.id
  pool           = "vm"
  format         = "qcow2"
  size           = var.disk_size
}

resource "libvirt_domain" "workers" {
  count  = var.workers
  name   = "node${count.index}"
  memory = var.workers_memory
  vcpu   = var.workers_vcpu
  cpu = {
    mode = "host-passthrough"
  }

  autostart = false

  disk {
    volume_id = element(libvirt_volume.workers-disks.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    hostname     = "node${count.index}"
    network_name = "kubernetes"
    network_id   = libvirt_network.kubernetes-network.id
    addresses    = ["172.10.10.11${count.index}"]
  }
}
