resource "azurerm_private_dns_zone" "this" {
  for_each            = toset(var.zones)
  name                = each.key
  resource_group_name = var.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = "${var.zone_name}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = data.azurerm_virtual_network.example.id
  registration_enabled  = false
}