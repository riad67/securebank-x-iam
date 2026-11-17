#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

command -v docker >/dev/null 2>&1 || { echo "Docker is required."; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "Docker Compose v2 is required (docker compose)."; exit 1; }
command -v openssl >/dev/null 2>&1 || { echo "OpenSSL is required."; exit 1; }

if [[ ! -f .env ]]; then
  cp .env.example .env
  ADMIN_SECRET="$(openssl rand -hex 24)"
  DB_SECRET="$(openssl rand -hex 32)"
  sed -i "s/CHANGE_ME_ADMIN_PASSWORD/${ADMIN_SECRET}/" .env
  sed -i "s/CHANGE_ME_DATABASE_PASSWORD/${DB_SECRET}/" .env
  chmod 600 .env
  echo "Created .env with generated credentials (file permissions: 600)."
  echo "Bootstrap admin username: kcadmin"
  echo "Bootstrap admin password: ${ADMIN_SECRET}"
  echo "Save this password in a secure password manager."
else
  echo "Existing .env found; leaving it unchanged."
fi

docker compose config --quiet
docker compose pull
docker compose up -d
echo
docker compose ps
echo
echo "Keycloak URL: http://localhost:8080/admin/"
echo "OIDC discovery: http://localhost:8080/realms/securebank/.well-known/openid-configuration"
echo "Wait for Keycloak startup, then create the 'securebank' realm if it does not already exist."
