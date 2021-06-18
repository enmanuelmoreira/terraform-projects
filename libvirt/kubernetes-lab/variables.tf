variable "os_image" {
  default = "https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-latest.x86_64.qcow2"
}

variable "ssh_key" {
  default = "terraform-libvirt.pub"
}

variable "masters" {
  default = 1
}
variable "workers" {
  default = 3
}

variable "masters_vcpu" {
  default = 4
}
variable "workers_vcpu" {
  default = 2
}

variable "masters_memory" {
  default = 8192
}

variable "workers_memory" {
  default = 4096
}

variable "disk_size" {
  default = 85899345920
}
