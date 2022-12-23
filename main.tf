terraform {
  cloud {
    organization = "emmafoxorg"

    workspaces {
      name = "githubapitf"
    }
  }
}
# test

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "name" {
  name = var.resource_group_name
  location = var.location
}