NS = c18s
REPO = kubectl

build:
	docker build -t $(NS)/$(REPO) .

shell:
	docker run --rm --name $(REPO) -it $(NS)/$(REPO) /bin/sh
