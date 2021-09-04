
ENV ?= dev

DO_PAT ?= $(shell pass show DigitalOcean/PersonalAccessTokens/terraform)
AUTH0_DOMAIN ?= $(shell pass show Auth0/myJobPlanner/Domain)
AUTH0_CLIENT_ID ?= $(shell pass show Auth0/myJobPlanner/Applications/Terraform/ClientId)
AUTH0_CLIENT_SECRET ?= $(shell pass show Auth0/myJobPlanner/Applications/Terraform/ClientSecret)

.PHONY: terraform-workspace
terraform-workspace:
	terraform workspace select myjobplanner-$(ENV)

.PHONY: terraform-plan
terraform-plan: export AUTH0_DOMAIN := $(AUTH0_DOMAIN)
terraform-plan: export AUTH0_CLIENT_ID := $(AUTH0_CLIENT_ID)
terraform-plan: export AUTH0_CLIENT_SECRET := $(AUTH0_CLIENT_SECRET)
terraform-plan: terraform-workspace
	@terraform plan -var "do_token=${DO_PAT}"