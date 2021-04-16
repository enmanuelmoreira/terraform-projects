terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.3"
    }
  }
}

#  # Libvirt system
# provider "libvirt" {
#   uri = "qemu+ssh://root@192.168.50.58/system"
# }

# Libvirt system
provider "libvirt" {
  uri = "qemu:///system"
}
