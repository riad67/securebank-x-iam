# Screenshot Capture Checklist

Save sanitized PNG files in `screenshots/` using these names:

1. `01-keycloak-admin-console.png` — Keycloak admin console landing page.
2. `02-securebank-realm.png` — `securebank` realm selected.
3. `03-oidc-client-settings.png` — client settings with secrets and sensitive values hidden.
4. `04-realm-roles.png` — realm roles list.
5. `05-user-groups.png` — groups and test-user role mapping.
6. `06-mfa-authentication.png` — configured OTP/WebAuthn authentication flow; do not show QR seeds.
7. `07-brute-force-protection.png` — brute-force protection settings.
8. `08-docker-compose-status.png` — `docker compose ps` showing healthy PostgreSQL and running Keycloak.
9. `09-oidc-discovery.png` — successful OIDC discovery endpoint (no tokens).
10. `10-project-structure.png` — repository tree in the terminal or editor.

## Capture rules

- Use test accounts and dummy data only.
- Never capture `.env`, passwords, client secrets, recovery codes, QR provisioning secrets, cookies, access tokens, or real customer information.
- Crop out unrelated desktop windows and personal notifications.
- Use consistent 16:9 screenshots where practical.
