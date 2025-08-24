resource "azurerm_static_web_app" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  repository_url      = var.repository_url

}