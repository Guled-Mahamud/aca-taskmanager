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
  use_cli         = true
  subscription_id = "3f48a398-9208-4440-a19d-dad6871f363c"
}
