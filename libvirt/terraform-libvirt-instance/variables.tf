variable "os_image" {
  default = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2"
}

variable "instance" {
  default = 1
}

variable "instance_vcpu" {
  default = 1
}
variable "instance_memory" {
  default = 1024
}


variable "disk_size" {
  default = 85899345920
}