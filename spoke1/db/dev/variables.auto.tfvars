env      = "dev"
location = "northeurope"

databases = {
  db-contoso = {
    db_admin_login        = "psqladmin"
    postgresql_version    = "16"
    db_sku_name           = "B_Standard_B1ms"
    db_storage_mb         = 32768
    db_storage_tier       = "P4"
  }

  # db-contoso2 = {
  #   db_admin_login        = "psqladmin2"
  #   postgresql_version    = "16"
  #   db_sku_name           = "B_Standard_B2ms"
  #   db_storage_mb         = 65536
  #   db_storage_tier       = "P6"
  # }
}

common_tags = {
  environment = "dev"
  project     = "contoso"
  managed_by  = "terraform"
}
