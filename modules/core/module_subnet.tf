module "aks-subnet" {
    source = "../subnet/"

    for_each = {
        for subnet in var.subnet_cidrs: subnet.name => subnet
    }

    resource_group_name  = azurerm_resource_group.main.name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = each.value.cidr
    name                 = each.value.name
    nsg_id               = azurerm_network_security_group.aks-cluster[each.value.name].id
}