env      = "dev"
location = "northeurope"

vnet_address_space = "10.1.0.0/16"
vnet_dns_server    = "168.63.129.16"

subnets = {
  backend = {
    address_prefixes = "10.1.2.0/24"
    delegation       = null
  }
  db = {
    address_prefixes = "10.1.3.0/24"
    delegation = {
      name         = "postgresql-delegation"
      service_name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

nsg_backend_rules = [
  {
    name                       = "allow-https-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  {
    name                       = "allow-http-inbound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  {
    name                       = "allow-postgresql-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "*"
    destination_address_prefix = "10.1.3.0/24"
  }
]

nsg_db_rules = [
  {
    name                       = "allow-postgresql-from-backend"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "10.1.2.0/24"
    destination_address_prefix = "*"
  },
  {
    name                       = "deny-all-inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

common_tags = {
  environment = "dev"
  project     = "contoso"
  managed_by  = "terraform"
}
