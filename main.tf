terraform {
  cloud {
    organization = "emmafoxorg"

    workspaces {
      name = "githubapitf"
    }
  }
}

provider "azurerm" {
  features {}
}
#


resource "azurerm_resource_group" "name" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "name" {
    name = var.storage_account
    resource_group_name = var.resource_group_name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
  
}

resource "azurerm_cosmosdb_account" "name" {
    name=var.cosmos_db_account
    location = var.location
    resource_group_name = var.resource_group_name
    offer_type = "Standard"
    kind = "MongoDB"
    enable_automatic_failover = true

    consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  
  geo_location {
    location          = "eastus"
    failover_priority = 1
  }

  geo_location {
    location          = "westus"
    failover_priority = 0
  }
}