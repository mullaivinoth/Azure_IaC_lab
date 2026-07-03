# ============================================================
# Wave 2 Imports
# Delete these blocks after successful import.
# ============================================================

import {
  to = azurerm_subnet.default
  id = "/subscriptions/${var.subscription_id}/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/virtualNetworks/vnet-bastion-lab/subnets/default"
}

import {
  to = azurerm_subnet.bastion
  id = "/subscriptions/${var.subscription_id}/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/virtualNetworks/vnet-bastion-lab/subnets/bastion_subnet"
}

import {
  to = azurerm_network_security_group.linux_vm
  id = "/subscriptions/${var.subscription_id}/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/networkSecurityGroups/vm-linux-lab-01-nsg"
}

import {
  to = azurerm_network_security_rule.ssh
  id = "/subscriptions/${var.subscription_id}/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/networkSecurityGroups/vm-linux-lab-01-nsg/securityRules/SSH"
}

import {
  to = azurerm_public_ip.linux_vm
  id = "/subscriptions/${var.subscription_id}/resourceGroups/vwan-lab-rg/providers/Microsoft.Network/publicIPAddresses/vm-linux-lab-pip"
}
