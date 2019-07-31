terragrunt = {
  dependencies {
    paths = [
      "../storage_account_ingestion-01",
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_storage_container"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Storage container module related variables
azurerm_storage_account_name_suffix   = "ingestion01"
azurerm_storage_container_name_suffix = "ingestion"
