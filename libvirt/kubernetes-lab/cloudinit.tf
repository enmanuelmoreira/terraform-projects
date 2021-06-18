resource "libvirt_volume" "os" {
  name   = "os"
  source = var.os_image
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  user_data = templatefile("${path.module}/cloud_init.cfg", {
    ssh_key = file("${path.module}/ssh/${var.ssh_key}")
  })
  pool = "iso"
}