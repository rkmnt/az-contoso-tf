module "database" {
  for_each = var.databases
  source   = "../../modules/database"

  env                    = var.env
  this_name              = each.key
  location               = var.location
  administrator_login    = each.value.db_admin_login
  administrator_password = var.db_admin_password
  postgresql_version     = each.value.postgresql_version
  sku_name               = each.value.db_sku_name
  storage_mb             = each.value.db_storage_mb
  storage_tier           = each.value.db_storage_tier
  private_dns_zone_name  = each.value.private_dns_zone_name
  vnet_id                = data.terraform_remote_state.networking.outputs.vnet_id
  delegated_subnet_id    = data.terraform_remote_state.networking.outputs.subnet_ids["db"]
  common_tags            = var.common_tags
}
