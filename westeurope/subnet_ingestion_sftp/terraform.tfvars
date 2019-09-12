terragrunt = {
  dependencies {
    paths = [
      "../vnet_common"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_subnet_container_delegation"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure subnet module variables
vnet_name                     = "k8s-01"
subnet_name                   = "ingestion-sftp-01"
azurerm_subnet_address_prefix = "10.1.0.0/16"
add_security_group             = false
azurerm_network_security_rules = []
