FROM subfuzion/envtpl as envtpl
FROM alpine:edge as base-image
ENV TZ=Asia/Bangkok
RUN apk add --no-cache tzdata freeradius freeradius-radclient freeradius-eap
COPY --from=envtpl /bin/envtpl /usr/local/bin/envtpl

FROM base-image
ENV DEBUG=0
ENV WORKDIR /etc/raddb
WORKDIR ${WORKDIR}
COPY bin/. /usr/local/bin/
COPY config ${WORKDIR}/template
CMD ["radius-server"]
