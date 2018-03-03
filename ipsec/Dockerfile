FROM alpine:edge

ENV WORKDIR /etc/ipsec.d
WORKDIR /etc/ipsec.d

COPY bin/. /usr/local/bin/

EXPOSE 500/udp 4500/udp

RUN docker-init

CMD tail -f /dev/null
