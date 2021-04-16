variable "os_image" {
  default = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2"
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