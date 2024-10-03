.PHONY: help api app dev build-cv dev-cv dev-app build astro

PWD := $(shell pwd)

help: ## Print help (this message)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build-cv: ## Build cv lambda api
	@cd ./api/cv && \
		cargo lambda build --release
	@mkdir -p ./dist
	@cd ./api/cv/target/lambda/cv/ && zip -r $(PWD)/dist/lambda-cv.zip ./*

api: build-cv ## Build all lambdas (future proof?)

app: ## Build web app
	@cd ./app && npm i
	@cd ./app && npm run build
	@mkdir -p ./dist
	@cd ./app/dist && zip -r $(PWD)/dist/app.zip ./*

build: app api ## Build whole project

dev-cv: ## Run dev for CV lambda
	@cd ./api/cv && cargo lambda watch

dev-app: ## Run astro dev
	@docker compose --profile dev up -d --force-recreate

dev: dev-app # dev-cv 
dev-dn: 
	@docker compose --profile dev down

astro: dev-app
	@docker compose -f $(PWD)/docker-compose.yml --profile dev exec dev-app sh
