terraform {
  backend "azurerm" {
    resource_group_name  = "taskmanager-rg"
    storage_account_name = "taskmanagertfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}