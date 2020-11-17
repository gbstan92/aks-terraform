module "cft-core" {
  source = "../../../../modules/core/"

  env          = var.env
  location     = var.location
  vnet_cidr    = var.vnet_cidr
  subnet_cidrs = var.subnet_cidrs
}