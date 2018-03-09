NS = c18s
REPO = ipsec

build:
	docker build -t $(NS)/$(REPO) .

shell:
	docker run --rm --name $(REPO) -it -p 500:500/udp -p 4500:4500/udp -p 1701:1701/udp -p 40080:40080 --privileged -v /lib/modules:/lib/modules $(NS)/$(REPO) /bin/sh
