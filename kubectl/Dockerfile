FROM alpine
RUN apk add --no-cache ca-certificates gettext \
  && apk add --update -t deps curl \
  && curl -fSL https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
  && apk del --purge deps \
  && rm -rf /var/cache/apk/* \
  && kubectl version --client

