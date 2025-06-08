output "vnet_address_space" {
  value = azurerm_virtual_network.tmvnet.address_space
}


output "container_address_prefixes" {
  value = azurerm_subnet.container_subnet.address_prefixes
}




output "subnet_id" {
  description = "The ID of the subnet for container"
  value       = azurerm_subnet.container_subnet.id
}

