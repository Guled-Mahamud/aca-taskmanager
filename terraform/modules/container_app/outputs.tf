output "fqdn" {
  description = "FQDN of the container app"
  value       = azurerm_container_app.taskmanager_app.latest_revision_fqdn
}
