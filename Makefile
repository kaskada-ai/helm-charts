.PHONY: docs lint
docs:
	docker run --rm --volume "$(shell pwd):/helm-docs" -u "$(shell id -u)" jnorwood/helm-docs:v1.11.0

lint:
	docker run --rm --workdir=/data --volume "$(shell pwd):/data" quay.io/helmpack/chart-testing:v3.7.1 ct lint --all