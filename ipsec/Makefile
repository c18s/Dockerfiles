NS = c18s
REPO = ipsec

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run \
		--rm -it \
		--name $(REPO) \
		--privileged \
		-p 500:500/udp \
		-p 4500:4500/udp \
		-p 1701:1701/udp \
		-p 40080:40080 \
		-e PSK=1234 \
		-e USERNAME=test \
		-e PASSWORD=1234 \
		-v /lib/modules:/lib/modules \
		-v $(CURDIR)/certs:/etc/ipsec.d/config/certs \
		$(NS)/$(REPO) /bin/sh
