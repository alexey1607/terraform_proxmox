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

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhGW0GEp0zPiqTdxQtgZRtChln6Rw6UgzTcyRD4ChaA4ATpeu0Z0yx9Tj1HExXMUcVZV4GV4EstlFuEgzZ5uPwST4FohUhmhEBXtctHDhMlUA74yX4r4nUFjqCxu7Eq0Flsbm6b88/rdYiJhhQedXolWFUFTqSgn9PkQk4E6E4FrhJyIzRQgu328Zikm0GDntjZqDQzd7lM74O/A0ub7+6k3P02O2TouneDqRTukstzuEzxZ6eJdfaXSgfOAG99F2vx6Iujr9pI3rbcfkVt6l36DKAS6pwVd+IrzgrUaEw6H33/1gp90jQfCkkTbXYqSdfkBybFhmHkArUq2rPtRUyCoRi7aIf9rGMbWtC2ebg4c9P468hFCAy42b4niJRXGSWf3VRydc+U9o/mLyIuA1aINexZtqtSxNroBaZbn/7w1MWYNcu3yVtbLFisVDvyD3XiaNlr7D3w1N6NimWTHjF7ldFIfuQUQQFs2v1yNPr0pIKjAwqzuK4VrxtGVk7/3E= alexey@mbp.local"
}

variable "lxc_base_name" {
  description = "Base name for LXC containers"
  type        = string
  default     = "dns"
}