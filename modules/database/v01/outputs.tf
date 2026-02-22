output "server_id" {
  description = "Resource ID of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.psql1.id
}

output "fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.psql1.fqdn
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg1.name
}
