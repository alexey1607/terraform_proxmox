variable "lxc_count" {
  description = "Number of LXC containers to create"
  type        = number
  default     = 2
}

variable "lxc_base_name" {
  description = "Base name for LXC containers"
  type        = string
  default     = "dns"
}

variable "lxc_template" {
  description = "Template for LXC containers"
  type        = string
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "lxc_storage" {
  description = "Storage for LXC containers"
  type        = string
  default     = "local-lvm"
}

variable "lxc_rootfs_size" {
  description = "Root filesystem size for LXC containers"
  type        = string
  default     = "30G"
}

variable "lxc_node" {
  description = "Proxmox node"
  type        = string
  default     = "pve"
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Number of CPU cores"
  type        = number
  default     = 1024
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhGW0GEp0zPiqTdxQtgZRtChln6Rw6UgzTcyRD4ChaA4ATpeu0Z0yx9Tj1HExXMUcVZV4GV4EstlFuEgzZ5uPwST4FohUhmhEBXtctHDhMlUA74yX4r4nUFjqCxu7Eq0Flsbm6b88/rdYiJhhQedXolWFUFTqSgn9PkQk4E6E4FrhJyIzRQgu328Zikm0GDntjZqDQzd7lM74O/A0ub7+6k3P02O2TouneDqRTukstzuEzxZ6eJdfaXSgfOAG99F2vx6Iujr9pI3rbcfkVt6l36DKAS6pwVd+IrzgrUaEw6H33/1gp90jQfCkkTbXYqSdfkBybFhmHkArUq2rPtRUyCoRi7aIf9rGMbWtC2ebg4c9P468hFCAy42b4niJRXGSWf3VRydc+U9o/mLyIuA1aINexZtqtSxNroBaZbn/7w1MWYNcu3yVtbLFisVDvyD3XiaNlr7D3w1N6NimWTHjF7ldFIfuQUQQFs2v1yNPr0pIKjAwqzuK4VrxtGVk7/3E= alexey@mbp.local"
}

variable "base_cidr" {
  description = "Base CIDR block"
  type        = string
  default     = "192.168.16.0/24"
}

variable "gateway" {
  description = "Gateway for LXC containers"
  type        = string
  default     = "192.168.16.1"
}