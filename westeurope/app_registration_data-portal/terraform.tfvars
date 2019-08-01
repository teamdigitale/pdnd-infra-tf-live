terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_app_registration"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Databricks workspace module related variables
azuread_application_name                        = "data-portal"
azuread_application_homepage                    = ""
azuread_application_identifier_uris             = ""
azuread_application_reply_urls                  = ["http://localhost:3000/callback"]
azuread_application_available_to_other_tenants  = false
azuread_application_oauth2_allow_implicit_flow  = true
azuread_application_type                        = "webapp/api"
