source "virtualbox-iso" "archsugar" {
  guest_os_type        = "ArchLinux_64" # $ VBoxManage list ostypes
  vm_name              = "archsugar_${local.today}"
  disk_size            = var.disk_size
  cpus                 = var.cpus
  memory               = var.memory
  guest_additions_mode = "disable" # install /w pacman inside VM

  iso_url      = "${local.iso_mirror}/archlinux/iso/${local.first_of_month}/archlinux-${local.first_of_month}-x86_64.iso"
  iso_checksum = "file:${local.iso_mirror}/archlinux/iso/${local.first_of_month}/md5sums.txt"

  http_directory   = "http"
  output_directory = "_build"

  headless = var.headless

  # EFI enabled VM - https://www.packer.io/docs/builders/virtualbox/iso#creating-an-efi-enabled-vm
  iso_interface = "sata"
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--firmware", "EFI"]
  ]

  # Setup sshd that will be use by subsequent provisioners
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  boot_command = [
    "<enter><wait10><wait10><wait10><wait10><wait10><wait10>",
    "/usr/bin/curl -O http://{{ .HTTPIP }}:{{ .HTTPPort }}/sshd.sh<enter><wait5>",
    "/usr/bin/bash sshd.sh<enter>",
  ]
  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
}

build {
  sources = ["sources.virtualbox-iso.archsugar"]
}
