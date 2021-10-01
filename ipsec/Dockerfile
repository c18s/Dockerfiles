FROM alpine:edge AS base-image
ENV TZ=Asia/Bangkok
RUN apk add --no-cache \
  tzdata \
  ppp \
  strongswan \
  xl2tpd \
  iptables \
  openssl \
  util-linux \
  lighttpd \
  supervisor \
  bind-tools \
  py-pip \
  && pip install envtpl

FROM base-image
ENV WORKDIR /etc/ipsec.d
WORKDIR ${WORKDIR}
COPY bin/. /usr/local/bin/
ADD config ${WORKDIR}/config
RUN ln -sfv /etc/ipsec.conf /etc/ipsec.d/ipsec.conf \
  && ln -sfv /etc/ipsec.secrets /etc/ipsec.d/ipsec.secrets \
  && ln -sfv /etc/ppp/chap-secrets /etc/ipsec.d/chap-secrets
CMD ["ipsec-server"]
