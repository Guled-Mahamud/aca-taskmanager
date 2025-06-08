output "frontdoor_endpoint_hostname" {
  value       = azurerm_cdn_frontdoor_endpoint.endpoint.host_name
  description = "Azure Front Door endpoint hostname"
}

output "custom_domain_name" {
  value       = azurerm_cdn_frontdoor_custom_domain.custom_domain.host_name
  description = "Custom domain configured on Front Door"
}