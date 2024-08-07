.PHONY: api app dev build-cv dev-cv dev-app build

build-cv:
	@cd ./services/cv && \
		cargo lambda build --release
	@mkdir -p ./dist
	@export path=`pwd`  && cd ./services/cv/target/lambda/cv/ && zip -r $$path/dist/lambda-cv.zip ./*

api: build-cv

app: 
	@cd ./app && npm i
	@cd ./app && npm run build
	@mkdir -p ./dist
	@export path=`pwd`  && cd ./app/dist && zip -r $$path/dist/app.zip ./*

build: app api

dev-cv:
	@cd ./services/cv && cargo lambda watch

dev-app:
	@cd ./app && npm run dev

dev: dev-app dev-cv
