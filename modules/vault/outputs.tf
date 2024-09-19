output "ips" {
  value = [for node in proxmox_lxc.vault : node.network[0].ip]
}

output "hostname" {
  value = [for node in proxmox_lxc.vault : node.hostname]
}
