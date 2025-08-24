resource "azurerm_virtual_network" "this" {
  for_each            = var.vnet_map
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet" "this" {
  for_each = {
    for vnet_key, vnet in var.vnet_map :
    vnet_key => {
      subnet_names    = vnet.subnet_names
      subnet_prefixes = vnet.subnet_prefixes
      resource_group_name = vnet.resource_group_name
      virtual_network_name = vnet.vnet_name
    }
  }

  count = length(each.value.subnet_names)

  name                 = each.value.subnet_names[count.index]
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = [each.value.subnet_prefixes[count.index]]
}