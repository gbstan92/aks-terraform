env      = "sbox"

location = "West Europe"

vm_size = "Standard_D2_v2"

cluster = {
    cluster-00 = {
      prefix       = "00",
      kube_version = "18.8"
    },
    cluster-01 = {
      prefix       = "01",
      kube_version = "18.8"
    }
}