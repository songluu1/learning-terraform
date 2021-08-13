# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "1f344d77-446e-4541-8b32-796ff8e839ca"
    features {}
}

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "my_first_vnet" {
    name = var.vnet_name
    location = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    address_space = var.vnet_addres_space
    tags = {
        deployment = "terraform"
    }
}

# resource "azurerm_subnet" "my_first_subnet" {
#     name = var.subnet_name
#     resource_group_name = data.azurerm_resource_group.rg.name
#     virtual_network_name = azurerm_virtual_network.my_first_vnet.name
#     address_prefixes = var.subnet_addres_space
# }


resource "azurerm_subnet" "my_first_subnet" {
    for_each = var.subnets
    name = each.value.name
    resource_group_name = data.azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.my_first_vnet.name
    address_prefixes = each.value.address_space
}