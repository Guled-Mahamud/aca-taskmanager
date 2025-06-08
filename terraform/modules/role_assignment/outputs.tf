output "identity_id" {
  description = "The ID of the user-assigned identity"
  value       = azurerm_user_assigned_identity.aca_identity.id
}

output "principal_id" {
  description = "The principal ID of the identity"
  value       = azurerm_user_assigned_identity.aca_identity.principal_id
}