terragrunt = {
  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_dns_zone_records_pdnd_italia_it"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

kubernetes_public_ip_name      = "k8s-01"
kubernetes_resource_group_name = "MC_pdnd-prod-rg_pdnd-prod-aks-k8s-01_westeurope"
kubernetes_environment         = "prod"
aks_cluster_name               = "k8s-01"

kubernetes_cname_records = [
  "ontopia-lodview",
  "ontopia-lode",
  "ontopia-virtuoso",
  "ontonethub",
  "semantic-katalod",
  "semantic-triplifier",
  "data-portal",
  "ckan",
  "superset",
  "dashboard",
  "www"
]