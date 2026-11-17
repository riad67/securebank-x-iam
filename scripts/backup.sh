#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
[[ -f .env ]] || { echo ".env not found. Run scripts/setup.sh first."; exit 1; }
set -a
source .env
set +a
mkdir -p backups
STAMP="$(date +%Y%m%d-%H%M%S)"
OUT="backups/keycloak-${STAMP}.dump"
docker compose exec -T postgres pg_dump -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -Fc > "${OUT}"
chmod 600 "${OUT}"
echo "Database backup created: ${OUT}"
echo "Keep this file private; it contains identity configuration and user records."
