variable "env" {}

variable "location" {}

variable "subnets_prefix" {
    default = ["10.1.0.0/24", "10.1.1.0/24"]
}