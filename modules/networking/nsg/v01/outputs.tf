output "nsg_id" {
  description = "Resource ID of the NSG"
  value       = azurerm_network_security_group.nsg1.id
}

output "nsg_name" {
  description = "Name of the NSG"
  value       = azurerm_network_security_group.nsg1.name
}
