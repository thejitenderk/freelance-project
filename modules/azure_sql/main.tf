resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_user
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "this" {
  name                = var.database_name
  server_id           = azurerm_mssql_server.this.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  sku_name            = "S0"
}
