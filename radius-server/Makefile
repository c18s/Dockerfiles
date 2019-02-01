NS = c18s
REPO = radius-server

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run \
		--rm -it \
		--name $(REPO) \
		-p 1812:1812/udp \
		-p 1813:1813/udp \
		-v $(CURDIR)/logs:/var/log/radius \
		$(NS)/$(REPO) /bin/sh
