terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_datafactory"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Data Factory module specific variables
datafactory_name_suffix                                   = "df-01"
azurerm_data_factory_github_configuration_account_name    = "teamdigitale"
azurerm_data_factory_github_configuration_repository_name = "pdnd-datafactory"
