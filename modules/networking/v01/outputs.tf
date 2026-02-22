output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg1.name
}

output "vnet_id" {
  description = "Resource ID of the virtual network"
  value       = azurerm_virtual_network.vnet1.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet1.name
}

output "subnet_ids" {
  description = "Map of subnet key to subnet resource ID"
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
}
