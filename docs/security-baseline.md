# Security Baseline and Deployment Boundary

## Current lab profile

This repository intentionally binds Keycloak to `127.0.0.1:8080` and starts it with `start-dev`. This is appropriate only for a local development environment.

## Before using a shared host or production

- Use Keycloak production mode (`start`) rather than `start-dev`.
- Configure HTTPS and a stable, trusted hostname.
- Configure reverse-proxy headers and hostname settings deliberately.
- Do not expose the admin console or management endpoints publicly.
- Restrict inbound access with host firewall and network controls.
- Store secrets in a secrets manager; rotate credentials if exposed.
- Enable monitoring, audit-event collection, tested backups, and restore procedures.
- Patch Keycloak, PostgreSQL, the host OS, and container images.
- Review realm roles, client scopes, redirect URIs, CORS/web origins, and service accounts.
- Perform security testing only against systems you own or are authorized to test.

## Banking authorization boundary

Keycloak roles are not a substitute for backend authorization. The SecureBank-X API must independently check customer/account ownership, transaction state, limits, approval workflow, fraud controls, and audit requirements for every sensitive operation.
