ENV ?= dev

.PHONY: terraform-init
terraform-init: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-init:
	@terraform init

.PHONY: terraform-plan
terraform-plan: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-plan:
	@terraform plan