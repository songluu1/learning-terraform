# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "1f344d77-446e-4541-8b32-796ff8e839ca"
    features {}
}

# Create a resource group
resource "azurerm_resource_group" "my_resource_group" {
    name     = var.resource_group_name
    location = var.location
    tags = {
        deployment = "terraform"
    }

}
