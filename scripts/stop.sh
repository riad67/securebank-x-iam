#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
docker compose down
echo "Containers stopped. The named PostgreSQL volume was preserved."
