# Front Door Configuration


variable "profile_name" {
  type        = string
  description = "Name of the Azure Front Door profile"
}

variable "endpoint_name" {
  type        = string
  description = "Name of the Azure Front Door endpoint"
}

variable "sku_name" {
  type        = string
  description = "SKU tier for Azure Front Door (e.g. Standard_AzureFrontDoor)"
  default     = "Standard_AzureFrontDoor"
}


# Custom Domain Settings


variable "custom_domain_name" {
  type        = string
  description = "Your custom domain (e.g. taskmanager.guled.co.uk)"
}

variable "custom_name" {
  type        = string
  description = "Internal name for the custom domain resource"
  default     = "taskmanager-custom-domain"
}


# Origin Configuration


variable "origin_group_name" {
  type        = string
  description = "Name of the origin group (used for backend grouping)"
}

variable "origin_name" {
  type        = string
  description = "Name of the backend origin"
}

variable "origin_hostname" {
  type        = string
  description = "FQDN of the backend origin (e.g. container app FQDN)"
}


# Routing Configuration


variable "route_name" {
  type        = string
  description = "Name of the route definition in Front Door"
}


# Shared Settings


variable "resource_group" {
  type        = string
  description = "Name of the resource group where Front Door is deployed"
}