.PHONY: up down ps logs health backup config

up:
	docker compose up -d

down:
	docker compose down

ps:
	docker compose ps

logs:
	docker compose logs -f keycloak

health:
	./scripts/health-check.sh

backup:
	./scripts/backup.sh

config:
	docker compose config --quiet
