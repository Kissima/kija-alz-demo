# You can use the azurerm_client_config data resource to dynamically
# extract connection settings from the provider configuration.

data "azurerm_client_config" "current" {}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "5.0.0" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  default_location = var.default_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id    = data.azurerm_client_config.core.tenant_id
  root_id           = var.root_id
  root_name         = var.root_name
  library_path      = "${path.root}/lib"
  disable_telemetry = true

  deploy_core_landing_zones     = true
  deploy_identity_resources     = true
  deploy_management_resources   = true
  deploy_connectivity_resources = true
  deploy_corp_landing_zones     = true

  subscription_id_management = data.azurerm_client_config.current.subscription_id

  archetype_config_overrides   = local.archetype_config_overrides
  configure_identity_resources = local.configure_identity_resources
}