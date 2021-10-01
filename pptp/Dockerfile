FROM alpine:edge AS base-image
ENV TZ=Asia/Bangkok
RUN apk add --no-cache \
  tzdata \
  ppp \
  pptpd \
  iptables \
  util-linux \
  supervisor \
  bind-tools \
  py-pip \
  && pip install envtpl

FROM base-image
ENV WORKDIR /etc/ppp
WORKDIR ${WORKDIR}
COPY bin/. /usr/local/bin/
ADD config ${WORKDIR}/config
CMD ["pptp-server"]
