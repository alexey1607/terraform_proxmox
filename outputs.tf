output "admin_ip" {
  value = module.admin.ips
}

output "admin_hostname" {
  value = module.admin.hostname
}
output "dns_ip" {
  value = module.dns.ips
}

output "dns_hostname" {
  value = module.dns.hostname
}

output "lb_ip" {
  value = module.lb.ips
}

output "lb_hostname" {
  value = module.lb.hostname
}

output "ldap_ip" {
  value = module.lb.ips
}

output "vault_hostname" {
  value = module.vault.hostname
}

output "vault_ip" {
  value = module.vault.ips
}
