variable "name" {
 description = "Server name"
 type = string
}

variable "ssh_key" {
  description = "SSH public key for server access"
  type        = string
}

variable "env" {
 description = "Environment"
 type = string
}
