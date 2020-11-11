module "core" {
  source = "../../modules/core/"

  env      = var.env
  location = var.location
}

module "aks" {
  source = "../../modules/aks/"

  for_each = var.cluster

  env           = var.env
  location      = var.location
  kube_version  = each.value.kube_version
  vm_size       = var.vm_size
  clusterPrefix = each.value.prefix
  subnet = each.value.subnet
  virtual_network_name = module.core.virtual_network_name
  virtual_network_rg_name = module.core.virtual_network_rg_name
}