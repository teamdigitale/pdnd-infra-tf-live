terragrunt = {
  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_rg"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}
