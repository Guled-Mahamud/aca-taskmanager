# Azure Container App Environment

resource "azurerm_container_app_environment" "taskmanager_env" {
  name                       = var.container_env
  location                   = var.location
  resource_group_name        = var.resource_group
  infrastructure_subnet_id   = var.container_subnet
  internal_load_balancer_enabled = false
}

# Azure Container App

resource "azurerm_container_app" "taskmanager_app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.taskmanager_env.id
  resource_group_name          = var.resource_group
  revision_mode                = "Single"

   identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  template {
    container {
      name   = var.container_name
      image  = "${var.acr_login_server}/${var.container_name}:v8"
      cpu    = 0.25
      memory = "0.5Gi"

          }
  }

  registry {
    server   = var.acr_login_server
    identity = var.identity_id
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true

    }
  }
}