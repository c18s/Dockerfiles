FROM alpine

ENV WORKDIR /etc/ipsec.d
WORKDIR /etc/ipsec.d

COPY bin/. /usr/local/bin/
ADD config ${WORKDIR}/config

EXPOSE 500/udp 4500/udp 1701/udp 40080

RUN docker-init

CMD ["entrypoint"]
