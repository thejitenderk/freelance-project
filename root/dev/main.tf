module "app_service" {
  source   = "../../modules/app_service"
  name     = var.app_service_name
  location = var.app_service_location
  tags     = var.app_service_tags
  # Add other variables as needed
}

module "vnet" {
  source         = "../../modules/vnet"
  name           = var.vnet_name
  address_space  = var.vnet_address_space
  location       = var.vnet_location
  tags           = var.vnet_tags
  # Add other variables as needed
}

module "app_gateway" {
  source   = "../../modules/app_gateway"
  name     = var.app_gateway_name
  location = var.app_gateway_location
  tags     = var.app_gateway_tags
  # Add other variables as needed
}

module "azure_sql" {
  source         = "../../modules/azure_sql"
  name           = var.azure_sql_name
  location       = var.azure_sql_location
  admin_username = var.azure_sql_admin_username
  admin_password = var.azure_sql_admin_password
  tags           = var.azure_sql_tags
  # Add other variables as needed
}

module "bastion" {
  source   = "../../modules/bastion"
  name     = var.bastion_name
  location = var.bastion_location
  tags     = var.bastion_tags
  # Add other variables as needed
}

module "key_vault" {
  source   = "../../modules/key_vault"
  name     = var.key_vault_name
  location = var.key_vault_location
  tags     = var.key_vault_tags
  # Add other variables as needed
}

module "private_dns" {
  source         = "../../modules/private_dns"
  name           = var.private_dns_name
  resource_group = var.private_dns_resource_group
  tags           = var.private_dns_tags
  # Add other variables as needed
}

module "private_endpoint" {
  source   = "../../modules/private_endpoint"
  name     = var.private_endpoint_name
  location = var.private_endpoint_location
  tags     = var.private_endpoint_tags
  # Add other variables as needed
}

module "static_webapp" {
  source   = "../../modules/static_webapp"
  name     = var.static_webapp_name
  location = var.static_webapp_location
  tags     = var.static_webapp_tags
  # Add other variables as needed
}

# module "devops_agent_vm" {
#   source   = "../../modules/devops_agent_vm"
#   name     = var.devops_agent_vm_name
#   location = var.devops_agent_vm_location
#   vm_size  = var.devops_agent_vm_size
#   tags     = var.devops_agent_vm_tags
#   # Add other variables as needed
# }

# module "diagnostics" {
#   source   = "../../modules/diagnostics"
#   name     = var.diagnostics_name
#   location = var.diagnostics_location
#   tags     = var.diagnostics_tags
#   # Add other variables as needed
# }