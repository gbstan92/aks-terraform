resource "azurerm_kubernetes_cluster" "aks-infra-aks" {
  name                = "${var.env}-${var.clusterPrefix}-aks"
  location            = var.location
  resource_group_name = var.virtual_network_rg_name
  dns_prefix          = "${var.env}-${var.clusterPrefix}-aks"
  kubernetes_version  = var.kube_version

  default_node_pool {
    name                 = "nodepool"
    os_disk_size_gb      = 100
    node_count           = 1
    vm_size              = var.vm_size
    enable_auto_scaling  = true
    max_count            = 30
    min_count            = 1
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kube_version
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "Standard"
    outbound_type      = "loadBalancer"
    service_cidr       = "10.100.0.0/24"
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip     = "10.100.0.10"
  }

  tags = merge(
    var.default_tags,
    map(
      "environment", var.env
    )
  )
}