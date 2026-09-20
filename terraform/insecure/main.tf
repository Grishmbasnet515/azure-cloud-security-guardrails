
# SecureCorp Cloud Security Lab
# INTENTIONALLY INSECURE CONFIGURATION
# For static security testing only. DO NOT DEPLOY.

resource "azurerm_storage_account" "insecure" {

  name                     = "stinsecurelab001"
  resource_group_name      = "rg-securecorp-lab"
  location                 = "westeurope"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Vulnerability 1: Permits anonymous blob access
  allow_nested_items_to_be_public = true

  # Vulnerability 2: HTTPS is not enforced
  https_traffic_only_enabled = false

  # TLS 1.2 is explicitly required
  min_tls_version = "TLS1_2"

}