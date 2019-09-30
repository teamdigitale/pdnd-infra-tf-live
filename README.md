# Terraform infrastructure live for Piattaforma Digitale Nazionale Dati (PDND), previously DAF

The repository contains the Terragrunt (Terraform related) live scripts used to provision and maintain the PDND infrastructure.

## What is the PDND (previously DAF)?

More informations about the DAF can be found on the [Digital Transformation Team website](https://teamdigitale.governo.it/it/projects/daf.htm)

## Repository directories and files structure

```
Environment
    |_Deployment area
        |_ Module
```

The root folder contains one or more *environments*, for example *dev*, *staging*, *prod*

Each *environment* contains one or more *deployment areas*, for example *westeurope*.

Each deployment area contains one or more live scripts that have a one to one correspondence with a Terraform module. The Terraform modules are maintained in a [separate repository](https://github.com/teamdigitale/pdnd-infra-tf-modules).

Module variables and main Terragrunt configuration files are stored in *terraform.tfvars* files.
Modules can also optionally inherit shared variables from higher level folders. These variables may be stored at each level of the hierarchy in the *vars.tfvars* files. For example, the *westeurope* folder under each environment contains the variable `location = "westeurope"`, that is inherited by all the underlying modules.

## How to use the scripts

The sections describes how to provision the PDND infrastructure using the Terraform scripts in this repository.

Before using Terraform, 

* Be sure to be owner of the Azure subscription

* Be sure to be global administrator of the Azure AD tenant

* Copy the *.env.example* to *.env* and fill the *.env* file in with your details.

The very first time, only once, init the Azure environment to support Terraform:

```shell
cd utils
source az-init.sh
```

Each time, before using Terraform run

```shell
cd utils
source az-export.sh
```

To provision an entire infrastructure, run from the root folder

```shell
terragrunt apply-all
```

>NOTE: Substitute apply-all with destroy-all to destroy an entire environment

To apply a single live module, go in a live module folder and run

```shell
terragrunt apply
```

To provision a single module, go into the specific folder and run the same command.

## Local tests

If you have not committed a Terraform module yet and you'd like to test it run from the live module folder:

```shell
terragrunt apply --terragrunt-source PATH_TO_YOUR_LOCAL_MODULE_DIR
```

## How to clear the local cache

Sometimes you may need to remove the local Terragrunt cache. To do so run

```shell
find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
```

## How to contribute

Contributions are welcome. Feel free to [open issues](./issues) and submit a [pull request](./pulls) at any time, but please read [our handbook](https://github.com/teamdigitale/pdnd-handbook) first.

## License

Copyright (c) 2019 Presidenza del Consiglio dei Ministri

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
