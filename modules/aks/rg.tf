resource "azurerm_resource_group" "aks-infra-00-rg" {
  name     = "${var.env}-00-rg"
  location = var.location
}

resource "azurerm_resource_group" "aks-infra-01-rg" {
  name     = "${var.env}-01-rg"
  location = var.location
}