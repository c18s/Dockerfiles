NS = c18s
REPO = ci-docker

build:
	docker build -t $(NS)/$(REPO) .

clean: build
	docker system prune -f

shell:
	docker run --rm --name $(REPO) -it $(NS)/$(REPO) /bin/sh
