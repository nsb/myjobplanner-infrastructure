
ENV ?= dev

.PHONY: terraform-init
terraform-init: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-init: export TF_WORKSPACE := prod
terraform-init:
	@terraform init -input=false

.PHONY: terraform-plan
terraform-plan: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-plan: export TF_WORKSPACE := prod
terraform-plan:
	@terraform plan

.PHONY: terraform-apply
terraform-apply: export TF_API_TOKEN := $(shell pass show TF_API_TOKEN)
terraform-apply: export TF_WORKSPACE := prod
terraform-apply:
	@terraform apply