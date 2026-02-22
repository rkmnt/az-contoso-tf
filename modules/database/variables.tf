variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "this_name" {
  description = "Base name for resources in this module"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "administrator_login" {
  description = "PostgreSQL administrator username"
  type        = string
}

variable "administrator_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}

variable "postgresql_version" {
  description = "PostgreSQL major version (e.g. 15, 16)"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the PostgreSQL Flexible Server (e.g. B_Standard_B1ms)"
  type        = string
}

variable "storage_mb" {
  description = "Storage allocated in MB (minimum 32768)"
  type        = number
}

variable "storage_tier" {
  description = "Storage tier (e.g. P4 for 32GB, P6 for 64GB)"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS zone name (must end in .postgres.database.azure.com)"
  type        = string
}

variable "vnet_id" {
  description = "Resource ID of the VNet to link the private DNS zone to"
  type        = string
}

variable "delegated_subnet_id" {
  description = "Resource ID of the subnet delegated to Microsoft.DBforPostgreSQL/flexibleServers"
  type        = string
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
