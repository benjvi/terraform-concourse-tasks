#!/bin/bash
set -euo pipefail
cd "terraform-config/$TF_CONFIG_PATH"
# globs in $TFVARS_FILES need to be left unquoted
cp tfvars/$TFVARS_FILES .
# TODO: check s3 backend config endpoint field
terraform init --backend=true --backend-config="endpoint=$BACKEND_ENDPOINT,bucket=$BACKEND_BUCKET,key=$BACKEND_KEY,access_key=$BACKEND_ACCESS_KEY,secret_key=$BACKEND_SECRET_KEY"
terraform apply --auto-approve 
