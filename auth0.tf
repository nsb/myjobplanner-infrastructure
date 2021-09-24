resource "auth0_resource_server" "myjobplanner-api" {
  name        = "myjobplanner-api"
  identifier  = "https://api.myjobplanner.com"
  signing_alg = "RS256"

  scopes {
    value       = "create:business"
    description = "Create business"
  }

  token_lifetime                                  = 8600
  skip_consent_for_verifiable_first_party_clients = true
}

resource "auth0_client" "myjobplanner-api" {
  name                       = "myjobplanner-api"
  description                = "myJobPlanner Api application"
  app_type                   = "non_interactive"
  token_endpoint_auth_method = "client_secret_post"
  grant_types                = ["client_credentials"]
}

resource "auth0_client_grant" "myjobplanner-api" {
  client_id = auth0_client.myjobplanner-api.id
  audience  = auth0_resource_server.myjobplanner-api.identifier
  scope     = ["create:business"]
}
