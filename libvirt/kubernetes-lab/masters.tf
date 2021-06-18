resource "libvirt_volume" "masters-disks" {
  count          = var.masters
  name           = "master${count.index}.qcow2"
  base_volume_id = libvirt_volume.os.id
  pool           = "vm"
  format         = "qcow2"
  size           = var.disk_size
}

resource "libvirt_domain" "masters" {
  count  = var.masters
  name   = "master${count.index}"
  #firmware = var.uefi
  memory = var.masters_memory
  vcpu   = var.masters_vcpu
  cpu = {
    mode = "host-passthrough"
  }

  autostart = false

  disk {
    volume_id = element(libvirt_volume.masters-disks.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    hostname     = "master${count.index}"
    network_name = "kubernetes"
    network_id   = libvirt_network.kubernetes-network.id
    addresses    = ["172.10.10.10${count.index}"]
  }
}

/* provisioner "local-exec" {
  working_dir = "../ansible"
  command = "ansible-playbook --inventory -b --private-key ../keys/terraform-libvirt basic_deploy.yml"
} */