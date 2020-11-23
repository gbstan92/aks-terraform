output "virtual_network_name" {
  value = azurerm_virtual_network.main.name
}

output "virtual_network_rg_name" {
  value = azurerm_virtual_network.main.resource_group_name
}