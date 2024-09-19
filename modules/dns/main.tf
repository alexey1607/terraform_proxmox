locals {
  ip_addresses = [for i in range(var.lxc_count) : cidrhost(var.base_cidr, 100 + i)]
}

resource "proxmox_lxc" "dns" {
  ostemplate  = var.lxc_template
  target_node = var.lxc_node
  count       = var.lxc_count
  hostname    = "${var.lxc_base_name}-${count.index + 1}"
  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_rootfs_size
  }
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }

  ssh_public_keys = file("~/.ssh/id_rsa.pub")
  cores           = var.cores
  memory          = var.memory

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${local.ip_addresses[count.index]}/24"
    gw     = var.gateway
  }
  start = true
}
