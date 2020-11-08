module "core" {
    source = "../../modules/core/"

    env = var.env
    location = var.location
    subnets = var.subnets
}

module "aks" {
    source = "../../modules/aks/"

    for_each =  [for c in var.cluster: {
      prefix = c.prefix
      kube_version  = c.kube_version
    }] 
    
    env = var.env
    location = var.location
    kube_version = each.value.kube_version
    vm_size = var.vm_size
    clusterPrefix = each.value.prefix
}