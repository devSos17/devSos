.PHONY: help api app dev build-cv dev-cv dev-app build

help: ## Print help (this message)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build-cv: ## Build cv lambda api
	@cd ./services/cv && \
		cargo lambda build --release
	@mkdir -p ./dist
	@export path=`pwd`  && cd ./services/cv/target/lambda/cv/ && zip -r $$path/dist/lambda-cv.zip ./*

api: build-cv ## Build all lambdas (future proof?)

app: ## Build web app
	@cd ./app && npm i
	@cd ./app && npm run build
	@mkdir -p ./dist
	@export path=`pwd`  && cd ./app/dist && zip -r $$path/dist/app.zip ./*

build: app api ## Build whole project

dev-cv: ## Run dev for CV lambda
	@cd ./services/cv && cargo lambda watch

dev-app: ## Run astro dev
	@cd ./app && npm run dev

# dev: dev-app dev-cv 
