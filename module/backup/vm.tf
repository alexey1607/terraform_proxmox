resource "proxmox_vm_qemu" "alex_test" {
  target_node = "pve"
  desc        = "Cloud init Ubuntu"
  count       = 1
  onboot      = true

  vm_state = "stopped"

  hotplug = "network,disk,usb"

  # The template name to clone this vm from
  clone = "ubuntu2404"

  # Activate QEMU agent for this VM
  agent = 1

  os_type = "cloud-init"
  cores   = 1
  sockets = 1
  memory  = 1024
  name    = "test"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }

  # cloudinit_cdrom_storage = "nvme"
  bootdisk = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 32
        }
      }
    }
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}

