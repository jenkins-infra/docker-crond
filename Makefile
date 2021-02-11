.PHONY: build push run shell

DOCKER_IMAGE=jenkinsciinfra/crond
DOCKER_TAG=latest

build: ## Build the docker image
	docker build \
		-t $(DOCKER_IMAGE):$(DOCKER_TAG) \
		--no-cache \
		-f Dockerfile \
		.

push: ## Publish the docker image
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

run: ## Run the docker image
	docker run -i -t --name mirror --rm $(DOCKER_IMAGE):$(DOCKER_TAG)

shell: ## Run the docker image with a shell
	docker run -i -t --rm --entrypoint /bin/sh  $(DOCKER_IMAGE):$(DOCKER_TAG)

.PHONY: help
help: ## Show this Makefile's help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
