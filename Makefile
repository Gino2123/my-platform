# ─── Configuration ────────────────────────────────────────────
COMPOSE = docker compose
PHP     = $(COMPOSE) exec app php

# ─── Démarrage ────────────────────────────────────────────────
up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

build:
	$(COMPOSE) build --no-cache

# ─── Laravel ──────────────────────────────────────────────────
migrate:
	$(PHP) artisan migrate

migrate-fresh:
	$(PHP) artisan migrate:fresh --seed

seed:
	$(PHP) artisan db:seed

cache-clear:
	$(PHP) artisan cache:clear
	$(PHP) artisan config:clear
	$(PHP) artisan route:clear
	$(PHP) artisan view:clear

# ─── Utilitaires ──────────────────────────────────────────────
logs:
	$(COMPOSE) logs -f

shell:
	$(COMPOSE) exec app bash

tinker:
	$(PHP) artisan tinker

test:
	$(PHP) artisan test

# ─── Base de données ──────────────────────────────────────────
db-shell:
	$(COMPOSE) exec mysql mysql -u laravel -psecret laravel_db

# ─── Aide ─────────────────────────────────────────────────────
help:
	@echo ""
	@echo "  make up            Démarrer les conteneurs"
	@echo "  make down          Arrêter les conteneurs"
	@echo "  make build         Rebuild les images"
	@echo "  make migrate       Lancer les migrations"
	@echo "  make logs          Voir les logs en temps réel"
	@echo "  make shell         Shell dans le conteneur app"
	@echo "  make test          Lancer les tests"
	@echo ""

.PHONY: up down restart build migrate migrate-fresh seed \
        cache-clear logs shell tinker test db-shell help