# General Settings


variable "location" {
  type        = string
  description = "The Azure region for deployment"
  default     = "West Europe"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "taskmanager-rg"
}


# Virtual Network (VNet)


variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "taskmanager-vnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}


# Subnets


variable "container_subnet_name" {
  type        = string
  description = "Name of the subnet used for the container app"
  default     = "container-subnet"
}

variable "container_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the container subnet"
}


