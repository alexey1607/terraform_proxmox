output "ips" {
  value = [for node in proxmox_lxc.dns : node.network[0].ip]
}

output "hostname" {
  value = [for node in proxmox_lxc.dns : node.hostname]
}
