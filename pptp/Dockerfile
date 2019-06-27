FROM alpine:edge AS baseImage
ENV TZ=Asia/Bangkok
RUN apk add --no-cache \
  tzdata \
  ppp \
  pptpd \
  iptables \
  util-linux \
  supervisor \
  bind-tools \
  py2-pip \
  && pip install envtpl

FROM baseImage
ENV WORKDIR /etc/ppp
WORKDIR ${WORKDIR}
COPY bin/. /usr/local/bin/
ADD config ${WORKDIR}/config
CMD ["pptp-server"]
