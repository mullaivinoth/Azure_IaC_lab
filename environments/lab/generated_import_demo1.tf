# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/d6e34000-17b3-4ff6-b09d-47bee0f62b26/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/virtualNetworks/vnet-bastion-lab/subnets/snet-demo-import"
resource "azurerm_subnet" "demo1_import" {
  address_prefixes                              = ["10.101.50.0/26"]
  default_outbound_access_enabled               = true
  name                                          = "snet-demo-import"
  resource_group_name                           = "vwan-lab-rg"
  virtual_network_name                          = "vnet-bastion-lab"
}
