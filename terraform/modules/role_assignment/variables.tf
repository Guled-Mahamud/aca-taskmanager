
# General Settings


variable "location" {
  type        = string
  description = "The location for the deployment"
  default     = "West Europe"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "taskmanager-rg"
}


# Managed Identity


variable "identity_name" {
  type        = string
  description = "Name of the user-assigned managed identity"
  default     = "taskmanager_identity"
}


# Azure Container Registry (ACR)


variable "acr_id" {
  type        = string
  description = "The ID of the Azure Container Registry"
}

variable "acr_role" {
  type        = string
  description = "Role used to grant ACR pull access"
  default     = "AcrPull"
}