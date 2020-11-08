resource "azurerm_resource_group" "aks-infra-rg" {
  name     = "${var.env}-${var.clusterPrefix}-rg"
  location = var.location
}