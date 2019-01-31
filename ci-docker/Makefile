NS = c18s
REPO = ci-docker

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run --rm --name $(REPO) -it $(NS)/$(REPO) /bin/sh
