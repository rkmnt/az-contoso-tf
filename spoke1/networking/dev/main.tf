module "networking" {
  source = "../../../modules/networking/v01"

  env                = var.env
  this_name          = "spoke1"
  location           = var.location
  vnet_address_space = var.vnet_address_space
  vnet_dns_server    = var.vnet_dns_server
  subnets            = var.subnets
  common_tags        = var.common_tags
}

module "nsg_backend" {
  source = "../../../modules/networking/nsg/v01"

  env                 = var.env
  this_name           = "backend"
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  security_rules      = var.nsg_backend_rules
  common_tags         = var.common_tags
}

module "nsg_db" {
  source = "../../../modules/networking/nsg/v01"

  env                 = var.env
  this_name           = "db"
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  security_rules      = var.nsg_db_rules
  common_tags         = var.common_tags
}

resource "azurerm_subnet_network_security_group_association" "backend" {
  subnet_id                 = module.networking.subnet_ids["backend"]
  network_security_group_id = module.nsg_backend.nsg_id
}

resource "azurerm_subnet_network_security_group_association" "db" {
  subnet_id                 = module.networking.subnet_ids["db"]
  network_security_group_id = module.nsg_db.nsg_id
}
