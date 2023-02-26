source "vmware-iso" "fedora" {
  guest_os_type        = var.guest_os_type
  vm_name              = var.name
  cpus                 = var.cpus
  memory               = var.memory
  disk_size            = var.disk_size
  iso_checksum         = var.iso_checksum
  http_directory       = var.kickstart_dir
  iso_url              = var.iso_url
  output_directory     = var.output_directory
  ssh_username         = var.ssh_username
  ssh_agent_auth       = true
  ssh_timeout          = "15m"
  version              = "20"
  disk_adapter_type    = "nvme"
  network_adapter_type = "e1000e"
  usb                  = true
  vmx_data = {
    architecture       = var.architecture
    "usb_xhci.present" = true
  }
  boot_command = ["<wait><up><up>e<wait><down><down><end> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<F10><wait>"]
}

build {
  sources = ["source.vmware-iso.fedora"]
}
