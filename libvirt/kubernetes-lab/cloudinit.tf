resource "libvirt_volume" "os" {
  name   = "os"
  source = var.os_image
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool      = "iso"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}