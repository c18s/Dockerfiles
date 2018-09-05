FROM alpine

RUN apk add --no-cache --virtual .build-deps curl \
  && curl -L https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | sh \
  && apk del .build-deps
