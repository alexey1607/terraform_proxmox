variable "vm_name" {
  description = "VM name"
  type        = string
  default     = "admin"
}

variable "target_node" {
  description = "Proxmox node"
  type        = string
  default     = "pve"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_state" {
  description = "VM state"
  type        = string
  default     = "started"
}

variable "vm_hotplug" {
  description = "Hotplug devices"
  type        = string
  default     = "network,disk,usb"
}

variable "vm_template" {
  description = "VM template to clone"
  type        = string
  default     = "ubuntu2404"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "vm_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "vm_memory" {
  description = "Amount of memory in MB"
  type        = number
  default     = 1024
}

variable "network_config" {
  type = object({
    bridge = string
    model  = string
  })
  default = {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}

variable "bootdisk" {
  description = "Boot disk"
  type        = string
  default     = "scsi0"
}

variable "vm_disks" {
  type = object({
    storage = string
    size    = number
  })
  default = {
    storage = "local-lvm"
    size    = 32
  }
}