# SecureBank-X IAM Architecture

## Components

| Component | Responsibility |
|---|---|
| Keycloak 26.8.2 | Identity provider, OIDC authorization, MFA, realm roles |
| PostgreSQL 17 | Persistent Keycloak configuration and identity data |
| Docker Compose | Local service orchestration |
| SecureBank-X backend | JWT validation, account authorization, business rules |

## Authentication flow

1. The customer opens the banking application.
2. The application redirects the user to Keycloak using OIDC Authorization Code flow.
3. Keycloak authenticates the user and applies configured MFA.
4. Keycloak returns an authorization code to the registered callback.
5. The backend exchanges the code and validates the resulting tokens.
6. The backend applies account ownership, transaction limits, fraud checks, and audit rules.

Keycloak authenticates identities. The banking API remains responsible for financial authorization and business logic.
