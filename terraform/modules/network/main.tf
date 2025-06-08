# Virtual Network

resource "azurerm_virtual_network" "tmvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.vnet_address_space
  
}

# Subnet - Container App

resource "azurerm_subnet" "container_subnet" {
  name                 = var.container_subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.tmvnet.name
  address_prefixes     = var.container_address_prefixes

}



 