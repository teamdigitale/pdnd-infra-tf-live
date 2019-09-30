terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_app_registration_data-portal"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Databricks workspace module related variables
dns_domain_name_suffix                          = "pdnd.italia.it"
azuread_application_name_suffix                 = "data-portal"
azuread_application_homepage                    = "https://"
azuread_application_identifier_uris             = ["http://localhost:3000/callback"]
azuread_application_reply_urls                  = [
  "http://localhost:3000/callback",
  "https://data-portal.dev.pdnd.italia.it/callback"
]
azuread_application_available_to_other_tenants  = false
azuread_application_oauth2_allow_implicit_flow  = true
azuread_application_type                        = "webapp/api"
