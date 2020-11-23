module "aks" {
  source = "../../../../modules/aks/"

  for_each = {
        for aks in var.cluster: aks.name => aks
    }

  env                     = var.env
  location                = var.location
  kube_version            = each.value.k8s_version
  vm_size                 = var.vm_size
  clusterPrefix           = each.value.name
  subnet                  = data.azurerm_subnet.aks[each.value.name].id
  virtual_network_name    = "aks-${var.env}-vnet"
  virtual_network_rg_name = "aks-infra-${var.env}-rg"
}