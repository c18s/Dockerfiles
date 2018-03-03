NS = c18s
REPO = ipsec

build:
	docker build -t $(NS)/$(REPO) .

shell:
	docker run --rm --name $(REPO) -it -p 500:500/udp -p 4500:4500/udp --privileged -v /lib/modules:/lib/modules $(NS)/$(REPO) /bin/sh
