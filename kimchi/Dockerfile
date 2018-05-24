FROM debian:9

ARG DEBIAN_FRONTEND=noninteractive

ENV WORKDIR /opt/kimchi
WORKDIR ${WORKDIR}

COPY bin/. /usr/local/bin/
COPY config/supervisord.conf /etc/supervisord.conf

EXPOSE 8001

RUN docker-init

CMD ["entrypoint"]
