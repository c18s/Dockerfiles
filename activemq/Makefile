NS = c18s
REPO = activemq
RUN_OPT = -p 1883:1883 -p 5672:5672 -p 8161:8161 -p 61613:61613 -p 61614:61614 -p 61616:61616

build:
	docker build -t $(NS)/$(REPO) .
	docker images --filter 'reference=$(NS)/$(REPO)'

shell:
	docker run --rm --name $(REPO) -it $(RUN_OPT) $(NS)/$(REPO) /bin/sh
