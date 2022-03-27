NS = c18s
REPO = openresty:1.19

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run --rm --name $(REPO) -it -p 80:80 -p 443:443 $(NS)/$(REPO) /bin/sh
