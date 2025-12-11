NS       = c18s
NAME     = openresty
TAG      = 1.27
IMAGE    = $(NS)/$(NAME):$(TAG)
PLATFORM ?= linux/amd64

build:
	docker buildx build --platform=$(PLATFORM) -t $(IMAGE) --load .
	docker images --filter 'reference=$(IMAGE)'

shell:
	docker run --rm --name $(NAME)-$(TAG) -it \
		-p 80:80 -p 443:443 \
		$(IMAGE) /bin/sh
