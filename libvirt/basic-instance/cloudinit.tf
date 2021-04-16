resource "libvirt_volume" "almalinux8" {
  name = "almalinux8"
  #source = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2"
  source = "/home/enmanuelmoreira/Descargas/AlmaLinux-8.3-x86_64-20210326.qcow2"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool      = "iso"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}