DOCKER_IMAGE=spjmurray/couchbase-antora-preview
DOCKER_TAG=0.0.1

.PHONY: all
all:
	docker build . -t ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: requirements
requirements:
	pip install -r requirements.txt
