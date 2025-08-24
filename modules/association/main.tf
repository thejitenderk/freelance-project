#Static Web App – Private DNS Zone & Link

resource "azurerm_private_dns_zone" "staticweb" {
  name                = "privatelink.azurestaticapps.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "staticweb_link" {
  name                  = "staticweb-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.staticweb.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
}

# App Service – Private DNS Zone & Link

resource "azurerm_private_dns_zone" "appsvc" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "appsvc_link" {
  name                  = "appsvc-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.appsvc.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
}

# Key Vault – Private DNS Zone & Link
resource "azurerm_private_dns_zone" "kv" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "kv_link" {
  name                  = "kv-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.kv.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
}

#Azure SQL – Private DNS Zone & VNet Link

resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_link" {
  name                  = "sql-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
}


