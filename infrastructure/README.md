# Infrastructure

This contains all terraform code to build infrastructure for COMP9323

# Initialisation

```sh
# Modify main.tf to use the s3 bucket and dynamodb table definition from remote

# initialise terraform
$ terraform init

# initialise workspaces
$ make init-workspaces

# Copy boilerplate terraform scripts

# Setup staging
$ make plan-staging
$ make apply-staging
```
