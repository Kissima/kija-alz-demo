# Configure the custom settings for the core module
locals {
  archetype_config_overrides = {
    # 
    identity = {
      parameters = {
        Deploy-vm-Backup = {
          effect = "auditIfNotExists"
        }
      }
    }
  }
}