output "subnets" {
    value = azurerm_subnet.example.*.id
}