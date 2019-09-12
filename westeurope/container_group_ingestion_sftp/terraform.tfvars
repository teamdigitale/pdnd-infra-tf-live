terragrunt = {
  dependencies {
    paths = [
      # "../service_principal_ingestion_sftp",
      "../storage_account_ingestion_sftp_share"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_container_group_ingestion_sftp"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Service Principal module variables
vnet_name                                         = "k8s-01"
subnet_name                                       = "ingestion-sftp-01"
azurerm_container_group_name_suffix               = "ingestionsftp"
azurerm_container_group_ip_address_type           = "private"
azurerm_container_group_container_image           = "atmoz/sftp:debian-jessie"
azurerm_container_group_container_cpu             = "2"
azurerm_container_group_container_memory          = "2"
azurerm_container_group_container_port            = 22
azurerm_container_group_container_sftp_user       = "teamdigitale"
storage_account_name                              = "ingestionsftp"
azurerm_storage_share_name                        = "ingestionsftp"
azurerm_azuread_service_principal_name            = "ingestionsftp"
storage_account_share_name_suffix                 = "ingestionsftp"
log_analytics_workspace_name                      = "01"
key_vault_secret_sftp_user_pass                   = "ingestion-sftp-user-pass"
