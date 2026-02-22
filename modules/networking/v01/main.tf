resource "azurerm_resource_group" "rg1" {
  name     = "rg-${var.env}-${var.this_name}"
  location = var.location

  tags = var.common_tags
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-${var.env}-${var.this_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.vnet_address_space]
  dns_servers         = [var.vnet_dns_server]

  tags = var.common_tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = "snet-${var.env}-${each.key}"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = [each.value.address_prefixes]

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_name
        actions = delegation.value.actions
      }
    }
  }
}
