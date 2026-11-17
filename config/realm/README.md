# Realm export / import

Realm exports can contain sensitive configuration, user data, and client secrets. The `.gitignore` excludes JSON and ZIP exports in this directory by default.

For a portable, sanitized project demonstration:

1. Export the `securebank` realm using the Keycloak-supported export procedure for your deployed version.
2. Review the export locally.
3. Remove test-user personal data and rotate or replace client secrets.
4. Confirm no passwords, tokens, recovery codes, or production data remain.
5. Only then create a separately reviewed, sanitized example file for source control.

Do not commit a raw realm export or a database backup.
