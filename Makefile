
ENV ?= dev

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

.PHONY: terraform-apply
terraform-apply: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-apply: export TF_WORKSPACE := $(ENV)
terraform-apply:
	@terraform apply -auto-approve