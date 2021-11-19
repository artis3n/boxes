source "parallels-iso" "kali" {
  guest_os_type          = var.os_type
  iso_url                = "https://cdimage.kali.org/kali-${var.iso_version}/kali-linux-${var.iso_version}-installer-arm64.iso"
  iso_checksum           = var.iso_checksum
  parallels_tools_flavor = "lin"

  ssh_username = "kali"
  ssh_password = "kali"
  ssh_timeout  = "30s"
  //   ssh_wait_timeout = "10000s"

  shutdown_command = "echo 'Packer: complete' | sudo -S shutdown -P now"

  cpus      = var.cpus
  memory    = var.memory
  disk_size = var.disk_size

  http_directory = "http"
  boot_command = [
    "<esc><wait>",
    "install <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
    "locale=en_US ",
    "keymap=us ",
    "hostname=${var.hostname} ",
    "domain='' ",
    "<enter>"
  ]
}

build {
  sources = [
    "source.parallels-iso.kali",
  ]

  provisioner "shell" {
    inline = [
      "echo 'hello world'",
    ]
  }
}
