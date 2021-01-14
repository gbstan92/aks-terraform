resource "azurerm_network_security_group" "aks-cluster" {
  for_each = {
    for subnet in var.subnet_cidrs : subnet.name => subnet
  }
  name                = "${each.value.name}-${var.env}-cluster-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
