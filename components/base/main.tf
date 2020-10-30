module "core" {
    source = "../components/core/"

    env = var.env
    location = var.location
}

module "aks" {
    source = "../components/aks/"

    env = var.env
    location = var.location
}