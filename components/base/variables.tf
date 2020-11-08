variable "env" {}

variable "location" {}

variable "subnets" {
  default = [
    {
      name   = "iaas"
      prefix = "10.0.1.0/24"
    },
    {
      name   = "appgw"
      prefix = "10.0.2.0/24"
    },
    {
      name   = "aks-00"
      prefix = "10.0.3.0/24"
    },
    {
      name   = "aks-01"
      prefix = "10.0.4.0/24"
    }
  ]
}

variable "vm_size" {}

variable "cluster" {
  default = [
    {
      prefix   = "00"
      kube_version = "18.8"
    },
    {
      prefix   = "01"
      kube_version = "18.8"
    }
  ]
}