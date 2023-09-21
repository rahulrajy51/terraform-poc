# Terraform Settings
# In this block we will define the Provider Configuration
terraform {
  required_version = ">=1.0.0"
  required_providers {
     azurerm = {
      source = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }
}


# Terraform provider
provider "azurerm" {
    features {}  
}

# Generic Input Variables
# Business Division
variable "business_divsion" {
  default = "sap" #This default name it will take after applying var.business_divsion
  type = string
  description = "Business Division in the large organization this Infrastructure belongs"
}
# Environment Variable
variable "environment" {
    description = "Environment Variable used as a prefix"
    type = string
    default = "dev"
}
# Azure Resources Group Location
variable "resource_group_location" {
    description = "Region in which Azure Resources to be created"
    type = string
    default = "eastus2"
  
}

# Azure Resources Group Name
variable "resource_group_name" {
    description = "Resource Group Name"
    type = string
    default = "devarch"
  
}

#Define resource_name_prefix and comman_tags only

locals {
  owner=var.business_divsion
  environment=var.environment
  resource_name_prefix="${var.business_divsion}-${var.environment}"          #sap-dev
  common_tags = {
    owner = local.owner
    environment   = local.environment
  }

}


#Create Resource Group

resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-${var.resource_group_name}"             #sap-dev-devarch
  location = var.resource_group_location
  tags = local.common_tags
}

#Create five diffrent distinct storage account

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.business_divsion}${var.resource_group_name}000${count.index}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  count = 5
}


#count.index -- It start with 0
#sapdevarch0000
#sapdevarch0001
#sapdevarch0002
#sapdevarch0003
#sapdevarch0004


