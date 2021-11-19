variable "iso_version" {
  type    = string
  default = "2021.3"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:72558ac80e6ab1c9c8afb6197cbd61101a5c87057c343de5b52abbe028d5ba68"
}

variable "cpus" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 4096
}

variable "disk_size" {
  type    = number
  default = 80000
}

variable "os_type" {
  type        = string
  default     = "debian"
  description = "Run prlctl create x --distribution list to find possible values."
}

variable "hostname" {
  type        = string
  default     = "kali"
  description = "The hostname to use when installing the VM."
}
