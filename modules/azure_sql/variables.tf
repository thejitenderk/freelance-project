variable "sql_server_name" {
  type = string
}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}
