terragrunt = {
  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_dns_zone"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure DNS zone module variables
dns_zone_suffix            = "pdnd.italia.it"
azurerm_dns_zone_zone_type = "Public"
dns_reverse_zone           = false
add_environment            = false
