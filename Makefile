IMG ?= controller:latest

.PHONY: run
run:
	@go run cmd/example-controller/main.go

.PHONY: format
format:
	@go fmt ./...

.PHONY: docker-build
docker-build: ## Build docker image with the manager.
	docker build -t ${IMG} .

.PHONY: deploy
deploy:
	kubectl apply -f deploy/*

.PHONY: undeploy
undeploy:
	kubectl delete -f deploy/*
