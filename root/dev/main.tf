# VNET + Subnets
module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
}

# App Gateway
module "app_gateway" {
  source              = "../../modules/app_gateway"
  name                = "dev-app-gw"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["app_gateway"]
  public_ip_name      = "dev-appgw-pip"
}

# Static Web App
module "static_webapp" {
  source              = "../../modules/static_webapp"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["static_webapp"]
}

# App Service Plan
module "app_service" {
  source              = "../../modules/app_service"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["app_service"]
}

# Azure SQL
module "azure_sql" {
  source              = "../../modules/azure_sql"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["sql"]
}

# Key Vault
module "key_vault" {
  source              = "../../modules/key_vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["private_endpts"]
}

# DevOps Agent VM
module "devops_agent_vm" {
  source              = "../../modules/devops_agent_vm"
  name                = "devops-agent"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["devops_agent_vm"]
  size                = "Standard_DS2_v2"
  admin_username      = "devopsadmin"
  admin_password      = "YourP@ssword1234" # Store in vault ideally
}

# Bastion Host
module "bastion" {
  source              = "../../modules/bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["bastion"]
}

# Diagnostics
module "diagnostics" {
  source              = "../../modules/diagnostics"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Private DNS
module "private_dns" {
  source              = "../../modules/private_dns"
  resource_group_name = var.resource_group_name
  zone_name           = "privatelink.database.windows.net"
  vnet_id             = module.vnet.vnet_id
}

# Private Endpoints for SQL
module "pe_sql" {
  source                = "../../modules/private_endpoint"
  name                  = "pe-sql"
  location              = var.location
  resource_group_name   = var.resource_group_name
  subnet_id             = module.vnet.subnet_ids["private_endpts"]
  target_resource_id    = module.azure_sql.sql_id
  subresource_names     = ["sqlServer"]
}

# Add similar modules for other private endpoints as needed
