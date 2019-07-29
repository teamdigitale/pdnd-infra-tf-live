# Terraform infrastructure live for Piattaforma Digitale Nazionale Dati (PDND), previously DAF

The repository contains the Terragrunt (Terraform related) live scripts used to provision and maintain the PDND infrastructure.

## What is the PDND (previously DAF)?

More informations about the DAF can be found on the [Digital Transformation Team website](https://teamdigitale.governo.it/it/projects/daf.htm)

## Tools references

The tools used in this repository are

* [Terragrunt](https://github.com/gruntwork-io/terragrunt)
* [Terraform](https://www.terraform.io/)

## Environments and branching structure

Code is versioned, depending on the environment it will run into. Branches represent different deployment environments. You may find in this repository a [dev](https://github.com/teamdigitale/pdnd-infra-tf-live/tree/development), a staging and a [prod](https://github.com/teamdigitale/pdnd-infra-tf-live) branch.

## Repository directories and files structure

```
Deployment area
    |_ Module
```

The root folder contains one or more *deployment areas*, for example *westeurope*.

Each deployment area contains one or more live scripts that have a one to one correspondence with a Terraform module. The Terraform modules are maintained in a [separate repository](https://github.com/teamdigitale/pdnd-infra-tf-modules).

Module variables and main Terragrunt configuration files are stored in *terraform.tfvars* files.
Modules can also optionally inherit shared variables from higher level folders. These variables may be stored at each level of the hierarchy in the *vars.tfvars* files. For example, the *westeurope* folder under each environment contains the variable `location = "westeurope"`, that is inherited by all the underlying modules.

## How to use the scripts

To provision an entire environment go into an environment folder and run

```shell
terragrunt apply-all
```

>Note: Substitute apply-all with destroy-all to destroy an entire environment

To provision a single module, go into the specific folder and run the same commands.

If you have not committed your modules yet, and you'd like to test the scripts using local modules run:

```shell
terragrunt apply-all --terragrunt-source YOUR_PATH_TO_THE_LOCAL_MODULES_DIR
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
