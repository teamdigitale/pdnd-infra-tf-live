terragrunt = {
  dependencies {
    paths = [
      "../resource_group",
      "../vnet_common"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_dns_zone"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure DNS zone module variables
dns_zone_prefix            = "k8s-01"
dns_zone_suffix            = "pdnd.internal"
azurerm_dns_zone_zone_type = "Private"
registration_vnets         = ["k8s-01"]
resolution_vnets           = []
