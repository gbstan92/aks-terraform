resource "azurerm_resource_group" "main" {
  name     = "aks-infra-${var.env}-rg"
  location = var.location
}