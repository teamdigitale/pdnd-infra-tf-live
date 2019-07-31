terragrunt = {
  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_dns_zone_records_pdnd_italia_it?ref=pdnd.italia.it"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}
