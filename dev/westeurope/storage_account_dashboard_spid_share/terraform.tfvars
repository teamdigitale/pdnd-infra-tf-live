terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_storage_account_share"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Storage account share module related variables
storage_account_name              = "dashboardspid"
storage_account_share_name_suffix = "dashboardspid"
azurerm_storage_share_quota       = "5"
