NS = c18s
REPO = pptp

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run \
		--rm -it \
		--name $(REPO) \
		--privileged \
		-p 1723:1723 \
		-v /lib/modules:/lib/modules \
		$(NS)/$(REPO) /bin/sh
