# Profile
resource "azurerm_cdn_frontdoor_profile" "profile" {
  name                = var.profile_name
  resource_group_name = var.resource_group
  sku_name            = var.sku_name  
}

# Endpoint
resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  name                      = var.endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile.id
}

# Custom Domain for Cloudflare
resource "azurerm_cdn_frontdoor_custom_domain" "custom_domain" {
  name                      = var.custom_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile.id
  host_name                 = var.custom_domain_name

  tls {
    certificate_type     = "ManagedCertificate"
    minimum_tls_version  = "TLS12"
  }
}



# Origin Group
resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  name                      = var.origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile.id

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 4
    successful_samples_required        = 3
  }

  health_probe {
    interval_in_seconds = 120
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }
}

# Origin pointing to Container App
resource "azurerm_cdn_frontdoor_origin" "fd_origin" {
  name                           = var.origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  host_name                      = var.origin_hostname
  origin_host_header             = var.origin_hostname
  http_port                      = 80
  https_port                     = 443
  enabled                        = true
  priority                       = 1
  weight                         = 1000
  certificate_name_check_enabled = true
}

# Route to container app
resource "azurerm_cdn_frontdoor_route" "route" {
  name                          = var.route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.fd_origin.id]
  supported_protocols           = ["Http", "Https"]
  patterns_to_match             = ["/*"]
  forwarding_protocol           = "MatchRequest"
  https_redirect_enabled        = true
  enabled                       = true
 

  
}
