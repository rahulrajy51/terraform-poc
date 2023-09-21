
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



