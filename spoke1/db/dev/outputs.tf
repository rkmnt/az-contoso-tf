output "postgresql_fqdns" {
  description = "Map of PostgreSQL server FQDNs"
  value       = { for k, v in module.database : k => v.fqdn }
}
