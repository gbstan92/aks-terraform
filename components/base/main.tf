module "core" {
    source = "../components/core/"

    env = var.env
    location = var.location
}