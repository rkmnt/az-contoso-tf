resource "azurerm_resource_group" "rg1" {
  name     = "rg-${var.env}-${var.this_name}"
  location = var.location

  tags = var.common_tags
}

resource "azurerm_private_dns_zone" "dns1" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg1.name

  tags = var.common_tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link1" {
  name                  = "dns-link-${var.env}-${var.this_name}"
  resource_group_name   = azurerm_resource_group.rg1.name
  private_dns_zone_name = azurerm_private_dns_zone.dns1.name
  virtual_network_id    = var.vnet_id

  tags = var.common_tags
}

resource "azurerm_postgresql_flexible_server" "psql1" {
  name                = "psql-${var.env}-${var.this_name}"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  version      = var.postgresql_version
  sku_name     = var.sku_name
  storage_mb   = var.storage_mb
  storage_tier = var.storage_tier

  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.dns1.id
  public_network_access_enabled = false

  tags = var.common_tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.dns_link1]
}
