output "ips" {
  value = [for dns in proxmox_lxc.dns : dns.network[0].ip]
}

output "hostname" {
  value = [for dns in proxmox_lxc.dns : dns.hostname]
}
