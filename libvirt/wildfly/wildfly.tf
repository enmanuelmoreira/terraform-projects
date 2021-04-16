provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "wildfly-qcow2" {
  name   = "wildfly.qcow2"
  pool   = "vm"
  source = "/home/enmanuelmoreira/Descargas/CentOS-7-x86_64-GenericCloud-2003.qcow2"
  # source = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"
  format = "qcow2"
}

resource "libvirt_domain" "wildfly" {
  name   = "wildfly"
  memory = 8192
  vcpu   = 6
  cpu = {
    mode = "host-passthrough"
  }

  autostart = true

  disk {
    volume_id = libvirt_volume.wildfly-qcow2.id
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "rhel8"
  }
}

output "IP" {
  value = libvirt_domain.wildfly.*.network_interface.0.addresses
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool      = "iso"
}


