# Azure Container Registry (ACR)

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Basic"
  admin_enabled       = false
}