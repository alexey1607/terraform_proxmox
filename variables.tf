variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox Token_ID"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox Token Secret"
  type        = string
  sensitive   = true
}

# variable "ssh_key" {
#   description = "SSH Key for LXC containers and VMs"
#   type        = string
#   sensitive   = true
# }

variable "lxc_base_name" {
  description = "Base name for LXC containers"
  type        = string
  default     = "dns"
}
