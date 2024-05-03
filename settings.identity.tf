# Configure the Identity resources settings
locals {
  configure_identity_resources = {
/*     settings = {
      identity = {
        enabled = true
        parameters = {
          Deploy-vm-Backup = {
            effect = "auditIfNotExists"
          }
        }
        config = {
          enable_deny_public_ip            = true
          enable_deny_rdprdp_from_internet = true
          enable_deny_subnet_without_nsg   = true
          enable_deploy_vm_backup          = true
        }
      }
    } */
  }
}