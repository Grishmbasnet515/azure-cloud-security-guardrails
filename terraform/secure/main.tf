
# SecureCorp Cloud Security Lab
# HARDENED CONFIGURATION
# Static security testing only.

resource "azurerm_storage_account" "secure" {

  name                     = "stsecurecorplab001"
  resource_group_name      = "rg-securecorp-lab"
  location                 = "westeurope"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Security Control 1: Disable anonymous blob access
  allow_nested_items_to_be_public = false

  # Security Control 2: Enforce HTTPS
  https_traffic_only_enabled = true

  # Security Control 3: Require TLS 1.2
  min_tls_version = "TLS1_2"

}