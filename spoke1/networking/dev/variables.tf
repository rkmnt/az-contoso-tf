variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
}

variable "vnet_dns_server" {
  description = "DNS server IP for the VNet"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    address_prefixes = string
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }))
  }))
}

variable "nsg_backend_rules" {
  description = "Security rules for the backend NSG"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "nsg_db_rules" {
  description = "Security rules for the db NSG"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
