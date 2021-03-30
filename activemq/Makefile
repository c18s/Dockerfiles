NS = c18s
REPO = activemq
RUN_OPT = -p 61616:61616 -p 5672:5672 -p 8161:8161

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run --rm --name $(REPO) -it $(RUN_OPT) $(NS)/$(REPO) /bin/bash
