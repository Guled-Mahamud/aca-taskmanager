terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.69.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = env("ARM_CLIENT_ID")
  client_secret   = env("ARM_CLIENT_SECRET")
  subscription_id = env("ARM_SUBSCRIPTION_ID")
  tenant_id       = env("ARM_TENANT_ID")
}
