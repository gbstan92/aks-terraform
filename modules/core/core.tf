resource "azurerm_resource_group" "aks-infra-rg" {
  name     = "aks-infra-${var.env}-rg"
  location = var.location
}

resource "azurerm_network_security_group" "aks-infra-cluster-nsg" {
  name                = "aks-infra-sbox-cluster-nsg"
  location            = azurerm_resource_group.aks-infra-rg.location
  resource_group_name = azurerm_resource_group.aks-infra-rg.name
}

resource "azurerm_network_security_group" "aks-infra-appgw-nsg" {
  name                = "aks-infra-sbox-cluster-nsg"
  location            = azurerm_resource_group.aks-infra-rg.location
  resource_group_name = azurerm_resource_group.aks-infra-rg.name
}

resource "azurerm_network_security_group" "aks-infra-iaas-nsg" {
  name                = "aks-infra-sbox-iaas-nsg"
  location            = azurerm_resource_group.aks-infra-rg.location
  resource_group_name = azurerm_resource_group.aks-infra-rg.name
}

resource "azurerm_virtual_network" "aks-infra-vnet" {
  name                = "aks-infra-${var.env}-vnet"
  location            = azurerm_resource_group.aks-infra-rg.location
  resource_group_name = azurerm_resource_group.aks-infra-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  dynamic "subnet" {
    for_each = [for s in var.subnets: {
      name   = s.name
      prefix = s.prefix
    }]

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.prefix
    }
  }

  tags = {
    environment = var.env
  }
}

resource "azurerm_key_vault" "kv" {
  name                        = "aks-infra-${var.env}-kv"
  location                    = azurerm_resource_group.aks-infra-rg.location
  resource_group_name         = azurerm_resource_group.aks-infra-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = var.env
  }
}



