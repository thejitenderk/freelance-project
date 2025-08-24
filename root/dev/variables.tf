variable "app_service_name" {
  type = string
}

variable "app_service_location" {
  type = string
}

variable "app_service_tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "vnet_location" {
  type = string
}

variable "vnet_tags" {
  type = map(string)
}

variable "app_gateway_name" {
  type = string
}

variable "app_gateway_location" {
  type = string
}

variable "app_gateway_tags" {
  type = map(string)
}

variable "azure_sql_name" {
  type = string
}

variable "azure_sql_location" {
  type = string
}

variable "azure_sql_admin_username" {
  type = string
}

variable "azure_sql_admin_password" {
  type = string
  sensitive = true
}

variable "azure_sql_tags" {
  type = map(string)
}

variable "bastion_name" {
  type = string
}

variable "bastion_location" {
  type = string
}

variable "bastion_tags" {
  type = map(string)
}

variable "key_vault_name" {
  type = string
}

variable "key_vault_location" {
  type = string
}

variable "key_vault_tags" {
  type = map(string)
}

variable "private_dns_name" {
  type = string
}

variable "private_dns_resource_group" {
  type = string
}

variable "private_dns_tags" {
  type = map(string)
}

variable "private_endpoint_name" {
  type = string
}

variable "private_endpoint_location" {
  type = string
}

variable "private_endpoint_tags" {
  type = map(string)
}

variable "static_webapp_name" {
  type = string
}

variable "static_webapp_location" {
  type = string
}

variable "static_webapp_tags" {
  type = map(string)
}

variable "devops_agent_vm_name" {
  type = string
}

variable "devops_agent_vm_location" {
  type = string
}

variable "devops_agent_vm_size" {
  type = string
}

variable "devops_agent_vm_tags" {
  type = map(string)
}

variable "diagnostics_name" {
  type = string
}

variable "diagnostics_location" {
  type = string
}

variable "diagnostics_tags" {
  type = map(string)
}
