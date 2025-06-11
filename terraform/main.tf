# Resource Group

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

# Virtual Network and Subnets (Network Module)


module "network" {
  source                      = "./modules/network"
  vnet_name                   = var.vnet_name
  resource_group              = azurerm_resource_group.resource_group.name
  location                    = var.location
  vnet_address_space          = var.vnet_address_space
  container_subnet_name       = var.container_subnet_name
  container_address_prefixes  = var.container_address_prefixes
 
  
}

# Azure Container Registry (ACR Module)

module "container_registry" {
  source              = "./modules/container_registry"
  resource_group      = azurerm_resource_group.resource_group.name
  location            = var.location
}

#Identity and ACR Role Assignment

module "role_assignment" {
  source           = "./modules/role_assignment"
  location            = var.location
  resource_group      = azurerm_resource_group.resource_group.name
  identity_name       = var.identity_name
  acr_id              = module.container_registry.acr_id
}


#Azure Container App + Environment

module "container_app" {
  source           = "./modules/container_app"
  location         = var.location
  resource_group   = azurerm_resource_group.resource_group.name
  container_env    = var.container_env
  app_name         = var.app_name
  container_name   = var.container_name
  acr_login_server = module.container_registry.acr_login_server     
  identity_id      = module.role_assignment.identity_id             
  container_subnet = module.network.subnet_id
                     
}


# Azure Front Door

module "frontdoor" {
  source = "./modules/frontdoor"

  profile_name         = var.profile_name
  endpoint_name        = var.endpoint_name
  origin_group_name    = var.origin_group_name
  origin_name          = var.origin_name
  origin_hostname      = module.container_app.fqdn  
  route_name           = var.route_name
  resource_group       = var.resource_group
  custom_domain_name   = var.custom_domain_name
}



