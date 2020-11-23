resource "azurerm_virtual_network" "main" {
  name                = "aks-${var.env}-vnet"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.vnet_cidr

  tags = merge(
    var.default_tags,
    map(
      "environment", var.env
    )
  )
}