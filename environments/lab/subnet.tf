resource "azurerm_subnet" "db" {
  name                            = "snet-db"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.2.0/26"]
  default_outbound_access_enabled = false
}
resource "azurerm_subnet" "db-demo11" {
  name                            = "snet-db-demo11"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.11.0/26"]
  default_outbound_access_enabled = false
}