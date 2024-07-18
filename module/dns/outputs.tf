output "ips" {
  value = [for ns in proxmox_lxc.dns : ns.network[0].ip]
}

output "hostname" {
  value = [for ns in proxmox_lxc.dns : ns.hostname]
}
