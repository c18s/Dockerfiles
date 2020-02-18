FROM alpine:edge
ARG RELEASE_URL=https://storage.googleapis.com/kubernetes-release/release
ARG FIX_VERSION=v1.16.0
ARG KUBECTL_PATH=/usr/local/bin/kubectl
WORKDIR /root
RUN apk add --no-cache ca-certificates curl gettext
RUN curl -fSL ${RELEASE_URL}/${FIX_VERSION}/bin/linux/amd64/kubectl \
  -o ${KUBECTL_PATH} \
  && chmod +x ${KUBECTL_PATH} \
  && kubectl version --client -o yaml
COPY bin/. /usr/local/bin/
