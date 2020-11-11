resource "azurerm_subnet" "aks-infra-subnet" {
  name                 = "aks-${var.clusterPrefix}-subnet"
  resource_group_name  = var.virtual_network_rg_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet]
}