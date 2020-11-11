output "virtual_network_name" {
  value = azurerm_virtual_network.aks-infra-vnet.name
}

output "virtual_network_rg_name" {
  value = azurerm_resource_group.aks-infra-rg.name
}