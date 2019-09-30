terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/pdnd-infra-tf-modules.git//azurerm_key_vault"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure DNS zone module variables
policy_object_list_map      = [
  # Diego Morales
  {
    object_id               = "acdd5906-8cef-4e21-a73f-128f41dd3749",
    key_permissions         = "create,delete,update,get,list",
    secret_permissions      = "set,delete,get,list",
    certificate_permissions = "create,delete,update,get,list"
  },
  # Luca Prete
  {
    object_id               = "eb41d832-a14e-40ab-ae91-c9507416611b",
    key_permissions         = "create,delete,update,get,list",
    secret_permissions      = "set,delete,get,list",
    certificate_permissions = "create,delete,update,get,list"
  },
  # Andrea Carlini
  {
    object_id               = "fb3c5e09-4ce3-478a-b979-5ea83d618f1c",
    key_permissions         = "create,delete,update,get,list",
    secret_permissions      = "set,delete,get,list",
    certificate_permissions = "create,delete,update,get,list"
  },
  # Giovanni Ruggiero
  {
    object_id               = "f49e959e-f0e9-45bd-b356-59cddfebb30c",
    key_permissions         = "create,delete,update,get,list",
    secret_permissions      = "set,delete,get,list",
    certificate_permissions = "create,delete,update,get,list"
  }
]
