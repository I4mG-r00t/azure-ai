variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "operator"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for the operator VM."
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "os_disk_size_gb" {
  type    = number
  default = 128
}

variable "enable_public_ip" {
  type    = bool
  default = false
}

variable "custom_data" {
  type        = string
  description = "cloud-init content."
  default     = null
}

variable "image_publisher" {
  type    = string
  default = "REPLACE_ME"
}

variable "image_offer" {
  type    = string
  default = "REPLACE_ME"
}

variable "image_sku" {
  type    = string
  default = "REPLACE_ME"
}

variable "image_version" {
  type    = string
  default = "latest"
}
