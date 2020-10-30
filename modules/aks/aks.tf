resource "azurerm_kubernetes_cluster" "aks-infra-aks" {
  name                = "${var.clusterName}-aks"
  location            = azurerm_resource_group.aks-infra-00-rg.location
  resource_group_name = azurerm_resource_group.aks-infra-00-rg.name
  dns_prefix          = "${var.clusterName}-aks"

  default_node_pool {
    name       = "nodepool"
    node_count = 1
    vm_size    = var.vm_size
    orchestrator_version = var.kube_version
    os_disk_size_gb = 100
    type = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "Standard"
    outbound_type = "loadBalancer"
    service_cidr = "10.0.0.0/16"
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip = "10.0.0.10"
  }

  tags = {
    Environment = var.env
  }
}

output "client_certificate_00" {
  value = azurerm_kubernetes_cluster.aks-infra-00-aks.kube_config.0.client_certificate
}

output "kube_config_00" {
  value = azurerm_kubernetes_cluster.aks-infra-00-aks.kube_config_raw
}