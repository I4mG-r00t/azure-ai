variable "project_name" {
  description = "Project name used for Azure resource naming."
  type        = string
  default     = "azure-ai"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "westeurope"
}

variable "ssh_public_key" {
  description = "SSH public key for the operator VM."
  type        = string
}