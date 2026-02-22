variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "databases" {
  description = "Map of PostgreSQL databases to create. Key is used as the server name."
  type = map(object({
    db_admin_login        = string
    postgresql_version    = string
    db_sku_name           = string
    db_storage_mb         = number
    db_storage_tier       = string
    private_dns_zone_name = string
  }))
}

variable "db_admin_password" {
  description = "PostgreSQL administrator password (shared across all instances)"
  type        = string
  sensitive   = true
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
