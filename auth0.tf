resource "auth0_resource_server" "myjobplanner-api" {
  name        = "myjobplanner-api"
  identifier  = "https://api.myjobplanner.com"
  signing_alg = "RS256"

  scopes {
    value       = "create:business"
    description = "Create businesses"
  }

  scopes {
    value       = "read:business"
    description = "Read businesses"
  }

  scopes {
    value       = "update:business"
    description = "Update businesses"
  }

  scopes {
    value       = "delete:business"
    description = "Delete businesses"
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
  scope     = ["create:business", "read:business", "update:business", "delete:business"]
}

resource "auth0_client" "myjobplanner-api-swagger-ui" {
  name                                = "myJobPlanner Api - Swagger UI"
  description                         = "myJobPlanner Api - Swagger UI"
  app_type                            = "spa"
  custom_login_page_on                = false
  is_first_party                      = true
  is_token_endpoint_ip_header_trusted = true
  token_endpoint_auth_method          = "client_secret_post"
  oidc_conformant                     = true
  callbacks                           = ["https://api.myjobplanner.com/callback", "http://localhost:3000/callback"]
  allowed_origins                     = ["https://api.myjobplanner.com", "http://localhost:3000"]
  grant_types                         = ["authorization_code", "http://auth0.com/oauth/grant-type/password-realm", "implicit", "password", "refresh_token"]
  allowed_logout_urls                 = ["https://api.myjobplanner.com", "http://localhost:3000"]
  web_origins                         = ["https://api.myjobplanner.com", "http://localhost:3000"]
  jwt_configuration {
    lifetime_in_seconds = 300
    secret_encoded      = true
    alg                 = "RS256"
    scopes = {
      foo = "bar"
    }
  }
  refresh_token {
    rotation_type                = "non-rotating"
    expiration_type              = "expiring"
    leeway                       = 15
    token_lifetime               = 1300000
    infinite_idle_token_lifetime = true
    infinite_token_lifetime      = false
    idle_token_lifetime          = 1296000
  }
  client_metadata = {
    app = "swagger"
  }
}

resource "auth0_client_grant" "myjobplanner-api-swagger-ui" {
  client_id = auth0_client.myjobplanner-api-swagger-ui.id
  audience  = auth0_resource_server.myjobplanner-api.identifier
  scope     = ["create:business", "read:business", "update:business", "delete:business"]
}
