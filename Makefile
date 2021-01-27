DOCKER_IMAGE=spjmurray/couchbase-antora-preview
DOCKER_TAG=1.5.2

.PHONY: all
all:
	docker build . -t ${DOCKER_IMAGE}:${DOCKER_TAG}
	docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest

.PHONY: requirements
requirements:
	pip install -r requirements.txt

.PHONY: release
release: all
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
	docker push ${DOCKER_IMAGE}:latest
