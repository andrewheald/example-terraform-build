#!/bin/bash
set -euo pipefail
launch_script_directory=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Install required version of terraform
terraform_version=`cat $launch_script_directory/.terraform-version`
echo "Using Terraform $terraform_version"
tfenv install $terraform_version
tfenv use $terraform_version

# Run Terraform action after fetching modules and validating
cd $launch_script_directory/terraform/layers/build
rm -fv .terraform/terraform.tfstate
terraform init
terraform get -update
terraform validate
terraform $@
