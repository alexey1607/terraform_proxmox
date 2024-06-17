output "ips" {
  value = [for admin in proxmox_vm_qemu.admin : admin.default_ipv4_address]
}

output "hostname" {
  value = [for admin in proxmox_vm_qemu.admin : admin.name]
}
