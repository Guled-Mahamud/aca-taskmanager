
# General Configuration


variable "location" {
  type        = string
  description = "The Azure region to deploy resources into"
  default     = "West Europe"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group"
  default     = "taskmanager-rg"
}


# Container App Configuration


variable "app_name" {
  type        = string
  description = "The name of the Azure Container App"
  default     = "taskmanager"
}

variable "container_env" {
  type        = string
  description = "The name of the Azure Container App Environment"
  default     = "taskmanager-env"
}

variable "container_name" {
  type        = string
  description = "The name of the container within the app"
  default     = "taskmanager"
}


# Networking & Registry Settings


variable "container_subnet" {
  type        = string
  description = "The ID of the subnet where the container app environment is deployed"
}

variable "identity_id" {
  type        = string
  description = "The ID of the user-assigned identity for ACR access"
}

variable "acr_login_server" {
  type        = string
  description = "The login server URL of the Azure Container Registry"
}