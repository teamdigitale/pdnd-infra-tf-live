terragrunt = {
  dependencies {
    paths = [
      "../key_vault"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_container_group"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Service Principal module variables
azurerm_container_group_name_suffix               = "ingestionsftp"
azurerm_container_group_ip_address_type           = "public"
azurerm_container_group_container_image           = "atmoz/sftp:latest"
azurerm_container_group_container_cpu             = "0.5"
azurerm_container_group_container_memory          = "1.5"
azurerm_container_group_container_port            = 22
azurerm_container_group_container_sftp_user       = "teamdigitale"
azurerm_container_group_container_sftp_env_users  = "[teamdigitale:teamdigitale:1001]"
azurerm_storage_account_name                      = "ingestionsftp"
azurerm_storage_share_name                        = "ingestionsftp"

