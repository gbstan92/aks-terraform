resource "azurerm_subnet" "main" {
  count                = length(var.address_prefixes)
  name                 = "${var.name}-0${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.address_prefixes[count.index]]
}