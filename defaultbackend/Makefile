NS = c18s
REPO = defaultbackend

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run --rm --name $(REPO) -it -p 8080:8080 $(NS)/$(REPO) /bin/sh
