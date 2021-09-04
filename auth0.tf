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
