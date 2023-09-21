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