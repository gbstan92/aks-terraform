module "core" {
  source = "../../modules/core/"

  env      = var.env
  location = var.location
  subnets  = var.subnets
}

module "aks" {
  source = "../../modules/aks/"

  for_each = var.cluster

  env           = var.env
  location      = var.location
  kube_version  = each.value.kube_version
  vm_size       = var.vm_size
  clusterPrefix = each.value.prefix
}