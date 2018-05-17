NS = c18s
REPO = kimchi

build:
	docker build -t $(NS)/$(REPO) .

clean: build
	docker system prune -f

shell:
	docker run --rm --name $(REPO) -it -p 8001:8001 $(NS)/$(REPO) /bin/bash
