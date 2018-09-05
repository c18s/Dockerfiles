FROM alpine

ENV WORKDIR /etc/ipsec.d
WORKDIR ${WORKDIR}}

COPY bin/. /usr/local/bin/
ADD config ${WORKDIR}/config

RUN docker-init

CMD ["entrypoint"]
