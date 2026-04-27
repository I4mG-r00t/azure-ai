variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "VNet address space."
  default     = ["10.20.0.0/16"]
}

variable "operator_subnet_prefixes" {
  type        = list(string)
  description = "Subnet prefixes for the operator VM subnet."
  default     = ["10.20.10.0/24"]
}
