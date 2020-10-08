FROM alpine:latest
ARG RELEASE_URL=https://storage.googleapis.com/kubernetes-release/release
ARG STABLE_VERSION_URL=${RELEASE_URL}/stable.txt
ARG KUBECTL_PATH=/usr/local/bin/kubectl
WORKDIR /root
RUN apk add --no-cache ca-certificates curl gettext bash openssl make
RUN curl -fsSL ${RELEASE_URL}/$(curl -s ${STABLE_VERSION_URL})/bin/linux/amd64/kubectl \
  -o ${KUBECTL_PATH} \
  && chmod +x ${KUBECTL_PATH} \
  && kubectl version --client -o yaml
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
  && helm version
COPY bin/. /usr/local/bin/
