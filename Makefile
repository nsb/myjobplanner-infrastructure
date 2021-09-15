
ENV ?= dev

.PHONY: terraform-workspace
terraform-workspace:
	terraform workspace select $(ENV)

.PHONY: terraform-init
terraform-init: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-init: export TF_WORKSPACE := $(ENV)
terraform-init:
	@terraform init -input=false

.PHONY: terraform-plan
terraform-plan: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-plan: export TF_WORKSPACE := $(ENV)
terraform-plan:
	@terraform plan