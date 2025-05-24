terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.48.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-dummy-filter"
  location = "centralus"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "cluster-dummy"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "dummy"

  default_node_pool {
    name       = "pooldummy"
    node_count = "1"
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}