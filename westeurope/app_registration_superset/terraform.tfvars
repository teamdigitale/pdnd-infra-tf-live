terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_app_registration_superset"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Databricks workspace module related variables
dns_domain_name_suffix                          = "pdnd.italia.it"
azuread_application_name_suffix                 = "superset"
azuread_application_homepage                    = "https://"
azuread_application_identifier_uris             = ["https://superset.dev.pdnd.italia.it"]
azuread_application_reply_urls                  = [
  "http://localhost:8088/oauth-authorized/azure",
  "https://superset.dev.pdnd.italia.it/oauth-authorized/azure"
]
azuread_application_available_to_other_tenants  = false
azuread_application_oauth2_allow_implicit_flow  = true
azuread_application_type                        = "webapp/api"
