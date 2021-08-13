# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "1f344d77-446e-4541-8b32-796ff8e839ca"
    features {}
}

module "my_first_module" {
    source              = ".//1"
    resource_group_name = "testing"
    location            = "westeurope"
}

module "my_second_module" {
    source              = ".//2"
    resource_group_name = "my_first_resource_group"
    vnet_name           = "my_first_vnet"
    vnet_addres_space   = ["10.0.0.0/16"]
    subnets = {
    "subnet1" = {
        name          = "testing1"
        address_space = ["10.0.0.0/24"]
        }
    "subnet2" = {
        name          = "testing2"
        address_space = ["10.0.1.0/24"]
        }
    }
}