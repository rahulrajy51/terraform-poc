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