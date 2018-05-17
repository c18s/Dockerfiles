NS = c18s
REPO = dante

build:
	docker build -t $(NS)/$(REPO) .

clean: build
	docker system prune -f

shell:
	docker run --rm --name $(REPO) -it -p 1080:1080 $(NS)/$(REPO) /bin/sh
