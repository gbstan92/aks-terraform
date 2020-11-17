data "azurerm_subnet" "aks" {
  for_each = {
    for aks in var.cluster: aks.name => aks
  }
  name                 = "aks-${each.value.name}"
  virtual_network_name = "aks-${var.env}-vnet"
  resource_group_name  = "aks-infra-${var.env}-rg"
}