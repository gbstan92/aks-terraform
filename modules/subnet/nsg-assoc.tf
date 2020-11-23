resource "azurerm_subnet_network_security_group_association" "aks-cluster" {
  count                     = length(var.address_prefixes)
  subnet_id                 = azurerm_subnet.main[count.index].id
  network_security_group_id = var.nsg_id
}