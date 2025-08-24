variable "location" {}
variable "resource_group_name" {}
variable "private_endpoints" {
  type = map(object({
    subnet_id           = string
    resource_id         = string
    subresource_names   = list(string)
  }))
}
