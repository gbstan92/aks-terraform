  subnet {
    name           = "iaas"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "appgw"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "aks-00"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.aks-infra-cluster-nsg.id
  }

  subnet {
    name           = "aks-01"
    address_prefix = "10.0.4.0/24"
    security_group = azurerm_network_security_group.aks-infra-cluster-nsg.id
  }


  resource "azurerm_subnet" "example" {
  count = length(var.subnets_prefix)
  name                 = "testsubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnets_prefix
}