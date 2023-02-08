resource "azurerm_resource_group" "rg_ex2" {
	name     = "resource_group_exercise_2"
	location = "eastus"
}

resource "azurerm_storage_account" "first-sa" {
	name                     = "firststorageaccount"
	resource_group_name      = azurerm_resource_group.rg_ex2.name
	location                 = azurerm_resource_group.rg_ex2.location

	account_tier             = "Standard"
	account_replication_type = "GRS"
}

resource "azurerm_storage_account" "second-sa" {
	name                     = "secondstorageaccount"
	resource_group_name      = azurerm_resource_group.rg_ex2.name
	location                 = azurerm_resource_group.rg_ex2.location
	depends_on               = [azurerm_storage_account.first-sa]

	account_tier             = "Standard"
	account_replication_type = "GRS"
}