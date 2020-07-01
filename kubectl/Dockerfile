FROM alpine:edge
ARG RELEASE_URL=https://storage.googleapis.com/kubernetes-release/release
ARG STABLE_VERSION_URL=${RELEASE_URL}/stable.txt
ARG KUBECTL_PATH=/usr/local/bin/kubectl
WORKDIR /root
RUN apk add --no-cache ca-certificates curl gettext bash openssl
RUN curl -fsSL ${RELEASE_URL}/$(curl -s ${STABLE_VERSION_URL})/bin/linux/amd64/kubectl \
  -o ${KUBECTL_PATH} \
  && chmod +x ${KUBECTL_PATH} \
  && kubectl version --client -o yaml
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
  && chmod 700 get_helm.sh \
  && ./get_helm.sh \
  && rm get_helm.sh \
  && helm version
COPY bin/. /usr/local/bin/
