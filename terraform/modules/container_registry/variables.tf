variable "resource_group" {
 type = string
 description = "Resource group name"
 default = "taskmanager-rg" 
}


variable "acr_name" {
  description = "Name of the ACR"
  type        = string
  default     = "taskmanagerapp"
}

variable "location" {
 type = string
 description = "the location for the deployment" 
 default = "West Europe"
}




