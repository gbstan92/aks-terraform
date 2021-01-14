project = "cft"
env = "prod"
location = "uksouth"
vnet_cidr = ["10.0.0.0/18"]
vm_size = "Standard_D4s_v3"
subnet_cidrs = [
    {
        name = "aks"
        cidr = ["10.0.1.0/24", "10.0.2.0/24"]
    },
    {
        name = "appgw"
        cidr = ["10.0.3.0/24"]
    },
    {
        name = "iaas"
        cidr = ["10.0.4.0/24"]
    }
]

cluster = [
    {
        name        = "00"
        k8s_version = "1.17.13"
    },
    {
        name        = "01"
        k8s_version = "1.17.13"
    }
]