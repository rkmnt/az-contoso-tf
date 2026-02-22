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

variable "vnet_address_space" {
  description = "Address space for the VNet (e.g. 10.1.0.0/16)"
  type        = string
}

variable "vnet_dns_server" {
  description = "DNS server IP for the VNet"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create. Key is used as subnet name suffix (snet-{env}-{key})"
  type = map(object({
    address_prefixes = string
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }))
  }))
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
