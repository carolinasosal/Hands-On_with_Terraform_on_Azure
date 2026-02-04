terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {

    organization = "carolinasosal"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }

}

provider "azurerm" {
  features {}
  #skip_provider_registration = true
  subscription_id = "80ea84e8-afce-4851-928a-9e2219724c69"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-4235586f-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}

module "securestorage" {
  source               = "app.terraform.io/carolinasosal/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "securestorage123"
}

