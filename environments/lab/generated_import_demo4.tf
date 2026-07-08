# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/d6e34000-17b3-4ff6-b09d-47bee0f62b26/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/virtualNetworks/vnet-bastion-lab/subnets/snet-demo4-import"
resource "azurerm_subnet" "demo4_import" {
  address_prefixes                              = ["10.101.4.0/26"]
  default_outbound_access_enabled               = true
  name                                          = "snet-demo4-import"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "vwan-lab-rg"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = null
  virtual_network_name                          = "vnet-bastion-lab"
}
