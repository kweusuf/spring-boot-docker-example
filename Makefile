GIT_SHA_FETCH := $(shell git rev-parse HEAD | cut -c 1-8)

IMAGE_NAME := spring-boot-${GIT_SHA_FETCH}

.PHONY: build
build: ## Build all binaries
	mvn clean install

.PHONY: docker-build
docker-build:
	docker build -t ${IMAGE_NAME} .

.PHONY: docker-run
docker-run:
	docker run --name ${IMAGE_NAME} -p 89:8080 ${IMAGE_NAME} > ${GIT_SHA_FETCH}.log 2>&1 & 
