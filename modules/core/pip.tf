resource "azurerm_public_ip" "aks-infra-00-aks" {
  name                = "${var.env}-00-aks"
  resource_group_name = azurerm_resource_group.aks-infra-rg.name
  location            = azurerm_resource_group.aks-infra-rg.location
  allocation_method   = "Static"

  tags = {
    environment = var.env
  }
}