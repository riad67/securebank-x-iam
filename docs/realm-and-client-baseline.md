# Realm and Client Configuration Baseline

## Realm

Create a dedicated realm:

- Realm name: `securebank`
- Do not create banking application users in the `master` realm.
- Enable login and the required security controls for the lab.

## Suggested realm roles

- `customer`
- `teller`
- `auditor`
- `compliance-officer`
- `fraud-analyst`
- `security-admin`

Assign only the minimum role required by each test account.

## Suggested groups

- `/Customers`
- `/Employees/Tellers`
- `/Employees/Auditors`
- `/Employees/Compliance`
- `/Employees/Fraud-Team`
- `/Security-Team`

## Web application client

Example client ID: `securebank-web`

For a server-side web application / BFF:

- Client authentication: ON (confidential client)
- Standard flow: ON
- Direct access grants: OFF
- Implicit flow: OFF
- Redirect URI: exact callback only, e.g. `http://localhost:8000/auth/callback`
- Web origin: exact development origin only, e.g. `http://localhost:8000`
- Store the client secret on the backend, never in browser JavaScript or source control.

For a browser-only SPA or mobile application, use a public client with Authorization Code + PKCE (`S256`); do not embed a client secret.

## API audience

Configure an API audience/client scope appropriate to the backend and ensure issued access tokens contain the expected audience. The backend must validate the signature using the realm JWKS and validate issuer, audience, expiry, token type, and required roles/scopes.

## MFA and account protection

- Prefer TOTP or WebAuthn/passkeys for MFA.
- Enable brute-force detection and tune lockout thresholds to avoid easy denial-of-service through account lockout.
- Use a password policy appropriate to the application risk.
- Review session idle and maximum lifetimes.
- Test recovery and account reset procedures.

All names and callback URLs above are examples. Replace them with the actual SecureBank-X application URLs and use exact redirect URIs.
