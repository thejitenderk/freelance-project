resource "azurerm_static_site" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_size            = "Free"
}
