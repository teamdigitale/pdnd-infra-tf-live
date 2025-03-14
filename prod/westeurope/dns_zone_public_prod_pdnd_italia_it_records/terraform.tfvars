terragrunt = {
  dependencies {
    paths = [
      "../dns_zone_public_prod_pdnd_italia_it",
      "../public_ip_k8s_01"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_dns_zone_records_prod_pdnd_italia_it"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure DNS zone records module variables
dns_zone_suffix                = "prod.pdnd.italia.it"

# Kubernetes specific variables start
kubernetes_public_ip_name      = "k8s-01"
kubernetes_resource_group_name = "MC_pdnd-prod-rg_pdnd-prod-aks-k8s-01_westeurope"
aks_cluster_name               = "k8s-01"
kubernetes_cname_records       = [
  "data-portal",
  "ontopia-virtuoso",
  "ontopia-lode",
  "ontopia-lodview",
  "superset",
  "ckan",
  "semantic-katalod",
  "semantic-triplifier",
  "ontonethub",
  "dashboard",
  "www"
]

# Kubernetes specific variables end
