.PHONY: help build-local up down logs ps migrate mysql psql test lint-check lint-fix
.DEFAULT_GOAL := help

build-local: ## Build docker image to local development
	docker compose build --no-cache

up: ## Do docker compose up
	docker compose up

down: ## Do docker compose down
	docker compose down

logs: ## Tail docker compose logs
	docker compose logs -f

ps: ## Check container status
	docker compose ps

migrate:  ## Execute migration
	docker compose exec todo-api rails db:migrate

mysql: ## Access MySQL Database
	docker compose exec mysql-db mysql -u root -p --default-character-set=utf8mb4

psql: ## Access PostgreSQL Database
	docker compose exec postgresql-db psql -U todo -d todo -W

test: ## Execute tests
	docker compose run --rm todo-api bundle exec rspec

lint-check: ## Run Rubocop for checking
	docker compose run --rm todo-api bundle exec rubocop

lint-fix: ## Run Rubocop with auto-correction
	docker compose run --rm todo-api bundle exec rubocop -A

help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'