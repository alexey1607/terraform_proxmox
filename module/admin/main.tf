resource "proxmox_vm_qemu" "admin" {
  name    = "${var.vm_name}-${count.index + 1}"
  target_node = var.target_node
  desc        = "Cloud init Ubuntu"
  count       = var.vm_count
  onboot      = true

  vm_state = var.vm_state

  hotplug = var.vm_hotplug

  clone = var.vm_template

  agent = 1

  os_type = "cloud-init"

  cores   = var.vm_cores
  sockets = var.vm_sockets
  memory  = var.vm_memory

  network {
    bridge = var.network_config.bridge
    model  = var.network_config.model
  }

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }

  bootdisk = var.bootdisk

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.vm_disks.storage
          size    = var.vm_disks.size
        }
      }
    }
  }

}

