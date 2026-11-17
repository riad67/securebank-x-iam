#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${KEYCLOAK_URL:-http://localhost:8080}"
DISCOVERY_URL="${BASE_URL}/realms/securebank/.well-known/openid-configuration"

echo "Checking Keycloak HTTP endpoint..."
curl --fail --silent --show-error "${BASE_URL}/" >/dev/null
echo "Keycloak HTTP endpoint: reachable"

echo "Checking securebank OIDC discovery..."
curl --fail --silent --show-error "${DISCOVERY_URL}" | python3 -m json.tool >/dev/null
echo "OIDC discovery: reachable and valid JSON"
