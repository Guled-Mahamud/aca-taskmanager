
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


# Networking


variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "taskmanager-vnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
  default = ["10.0.0.0/16"]
}

variable "container_subnet_name" {
  type        = string
  description = "Name of the container subnet"
  default     = "container-subnet"
}

variable "container_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the container subnet"
  default = ["10.0.0.0/23"]
}



# Azure Container Registry (ACR)


variable "acr_role" {
  type        = string
  description = "Role used to grant ACR pull access"
  default     = "AcrPull"
}


# Managed Identity


variable "identity_name" {
  type        = string
  description = "Name of the user-assigned managed identity"
  default     = "taskmanager_identity"
}


# Container App


variable "container_env" {
  type        = string
  description = "Name of the container app environment"
  default     = "taskmanager-env"
}

variable "app_name" {
  type        = string
  description = "Name of the Azure Container App"
  default     = "taskmanager"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
  default     = "taskmanager"
}


# Certificate (Front Door)


#variable "cert_path" {
#type        = string
#description = "Path to the PFX certificate file"
#}

#variable "cert_password" {
#type        = string
#description = "Password for the PFX certificate"
#sensitive   = true
#}


# Azure Front Door


variable "profile_name" {
  type        = string
  description = "Name of the Azure Front Door profile"
  default = "taskmanager-fd-profile"
}

variable "endpoint_name" {
  type        = string
  description = "Name of the Azure Front Door endpoint"
  default = "taskmanager-endpoint"
}

variable "origin_group_name" {
  type        = string
  description = "Name of the Front Door origin group"
  default = "taskmanager-origin-group"
}

variable "origin_name" {
  type        = string
  description = "Name of the Front Door origin"
  default = "taskmanager-origin"
}

variable "origin_hostname" {
  type        = string
  description = "FQDN of the origin (e.g. the Container App's URL)"
  default = "taskmanager.westeurope.azurecontainerapps.io"
}

variable "route_name" {
  type        = string
  description = "Name of the Front Door route"
  default = "taskmanager-route"
}

variable "custom_domain_name" {
  type        = string
  description = "Custom domain to associate with Front Door (e.g. taskmanager.guled.co.uk)"
  default = "taskmanager.guled.co.uk"
}

variable "sku_name" {
  type        = string
  description = "SKU name for Azure Front Door"
  default     = "Standard_AzureFrontDoor"
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}



# Trigger CI workflow --

