packer {
  required_version = ">= 1.7.0, < 2.0.0"

  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = ">= 1.0.0, < 2.0.0"
    }
  }
}

variable "boot_wait" {
  type    = string
  default = "3s"
}

variable "bundle_iso" {
  type    = string
  default = "false"
}

variable "communicator" {
  type    = string
  default = "ssh"
}

variable "country" {
  type    = string
  default = "US"
}

variable "cpus" {
  type    = string
  default = "4"
}

variable "description" {
  type    = string
  default = "Open edX devstack (x86_64 Debian Bullseye 11.x)"
}

variable "disk_size" {
  type    = string
  default = "50000"
}

variable "domain" {
  type    = string
  default = ""
}

variable "guest_os_type" {
  type    = string
  default = "Debian_64"
}

variable "headless" {
  type    = string
  default = "false"
}

variable "host_port_max" {
  type    = string
  default = "4444"
}

variable "host_port_min" {
  type    = string
  default = "2222"
}

variable "http_port_max" {
  type    = string
  default = "9000"
}

variable "http_port_min" {
  type    = string
  default = "8000"
}

variable "iso_checksum" {
  type    = string
  default = "sha512:4460ef6470f6d8ae193c268e213d33a6a5a0da90c2d30c1024784faa4e4473f0c9b546a41e2d34c43fbbd43542ae4fb93cfd5cb6ac9b88a476f1a6877c478674"
  # default = "file:http://cdimage.debian.org/cdimage/release/current/amd64/iso-cd/SHA512SUMS"
}

variable "iso_file" {
  type    = string
  default = "debian-11.7.0-amd64-netinst.iso"
}

variable "iso_path_external" {
  type    = string
  default = "https://cdimage.debian.org/cdimage/archive/11.7.0/amd64/iso-cd"
}

variable "keep_registered" {
  type    = string
  default = "false"
}

variable "keyboard" {
  type    = string
  default = "us"
}

variable "language" {
  type    = string
  default = "en"
}

variable "locale" {
  type    = string
  default = "en_US.UTF-8"
}

variable "memory" {
  type    = string
  default = "8096"
}

variable "min_vagrant_version" {
  type    = string
  default = "2.3.0"
}

variable "mirror" {
  type    = string
  default = "ftp.us.debian.org"
}

variable "packer_cache_dir" {
  type    = string
  default = "${env("PACKER_CACHE_DIR")}"
}

variable "preseed_file" {
  type    = string
  default = "base.preseed"
}

variable "qemu_binary" {
  type    = string
  default = "qemu-system-x86_64"
}

variable "shutdown_timeout" {
  type    = string
  default = "5m"
}

variable "skip_export" {
  type    = string
  default = "false"
}

variable "ssh_agent_auth" {
  type    = string
  default = "false"
}

variable "ssh_clear_authorized_keys" {
  type    = string
  default = "false"
}

variable "ssh_disable_agent_forwarding" {
  type    = string
  default = "false"
}

variable "ssh_file_transfer_method" {
  type    = string
  default = "scp"
}

variable "ssh_fullname" {
  type    = string
  default = "Devstack User"
}

variable "ssh_handshake_attempts" {
  type    = string
  default = "10"
}

variable "ssh_keep_alive_interval" {
  type    = string
  default = "5s"
}

variable "ssh_password" {
  type    = string
  default = "devstack"
}

variable "ssh_port" {
  type    = string
  default = "22"
}

variable "ssh_pty" {
  type    = string
  default = "false"
}

variable "ssh_timeout" {
  type    = string
  default = "120m"
}

variable "ssh_username" {
  type    = string
  default = "devstack"
}

variable "start_retry_timeout" {
  type    = string
  default = "5m"
}

variable "system_clock_in_utc" {
  type    = string
  default = "true"
}

variable "timezone" {
  type    = string
  default = "UTC"
}

variable "vagrantfile_template" {
  type    = string
  default = "vagrant.rb.j2"
}

variable "version" {
  type    = string
  default = "0.0.0"
}

variable "vm_name" {
  type    = string
  default = "devstack-bullseye"
}

variable "vnc_vrdp_bind_address" {
  type    = string
  default = "127.0.0.1"
}

variable "vnc_vrdp_port_max" {
  type    = string
  default = "6000"
}

variable "vnc_vrdp_port_min" {
  type    = string
  default = "5900"
}

variable "accelerator" {
  type    = string
  default = "kvm"
}

locals {
  output_directory = "build"
}

source "qemu" "devstack-qemu" {
  accelerator = var.accelerator
  boot_command = [
    "<wait><wait><wait><esc><wait><wait><wait>",
    "/install.amd/vmlinuz ",
    "initrd=/install.amd/initrd.gz ",
    "auto=true ",
    "url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_file} ",
    "hostname=${var.vm_name} ",
    "domain=${var.domain} ",
    "interface=auto ",
    "vga=788 noprompt quiet --<enter>"
  ]
  boot_wait            = var.boot_wait
  communicator         = var.communicator
  cpus                 = var.cpus
  disk_cache           = "writeback"
  disk_compression     = false
  disk_discard         = "ignore"
  disk_image           = false
  disk_interface       = "virtio-scsi"
  disk_size            = var.disk_size
  format               = "qcow2"
  headless             = var.headless
  host_port_max        = var.host_port_max
  host_port_min        = var.host_port_min
  http_content         = { "/${var.preseed_file}" = templatefile(var.preseed_file, { var = var }) }
  http_port_max        = var.http_port_max
  http_port_min        = var.http_port_min
  iso_checksum         = var.iso_checksum
  iso_skip_cache       = false
  iso_target_extension = "iso"
  iso_target_path      = "${regex_replace(var.packer_cache_dir, "^$", "/tmp")}/${var.iso_file}"
  iso_urls = [
    "${var.iso_path_external}/${var.iso_file}"
  ]
  machine_type                 = "pc"
  memory                       = var.memory
  net_device                   = "virtio-net"
  output_directory             = local.output_directory
  qemu_binary                  = var.qemu_binary
  shutdown_command             = "echo '${var.ssh_password}' | sudo -E -S poweroff"
  shutdown_timeout             = var.shutdown_timeout
  skip_compaction              = true
  skip_nat_mapping             = false
  ssh_agent_auth               = var.ssh_agent_auth
  ssh_clear_authorized_keys    = var.ssh_clear_authorized_keys
  ssh_disable_agent_forwarding = var.ssh_disable_agent_forwarding
  ssh_file_transfer_method     = var.ssh_file_transfer_method
  ssh_handshake_attempts       = var.ssh_handshake_attempts
  ssh_keep_alive_interval      = var.ssh_keep_alive_interval
  ssh_password                 = var.ssh_password
  ssh_port                     = var.ssh_port
  ssh_pty                      = var.ssh_pty
  ssh_timeout                  = var.ssh_timeout
  ssh_username                 = var.ssh_username
  use_default_display          = false
  vm_name                      = "${var.vm_name}.qcow2"
  vnc_bind_address             = var.vnc_vrdp_bind_address
  vnc_port_max                 = var.vnc_vrdp_port_max
  vnc_port_min                 = var.vnc_vrdp_port_min
}

build {
  description = "Can't use variables here yet!"

  sources = ["source.qemu.devstack-qemu"]

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["echo '${var.ssh_username} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/99${var.ssh_username}", "chmod 0440 /etc/sudoers.d/99${var.ssh_username}"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["apt-get update", "apt-get --yes dist-upgrade", "apt-get clean"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["apt-get --yes install make python docker-compose git python3-pip"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["usermod -aG docker devstack"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    expect_disconnect   = true
    inline              = ["groups $USER"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["systemctl status docker"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["sed -i 's/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"net.ifnames=0 biosdevname=0 interface=auto\"/' /etc/default/grub", "update-grub"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["echo 'allow-hotplug eth0' >> /etc/network/interfaces", "echo 'iface eth0 inet dhcp' >> /etc/network/interfaces"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    binary              = false
    execute_command     = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect   = true
    inline              = ["reboot"]
    inline_shebang      = "/bin/sh -e"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  provisioner "shell" {
    pause_before        = "60s"
    binary              = false
    expect_disconnect   = true
    script              = "mkdir-clone-and-provision.sh"
    skip_clean          = false
    start_retry_timeout = var.start_retry_timeout
  }

  post-processor "checksum" {
    checksum_types = ["md5", "sha1", "sha256", "sha512"]
    output = "${local.output_directory}/${var.vm_name}_{{.ChecksumType}}.checksum"
  }
}
