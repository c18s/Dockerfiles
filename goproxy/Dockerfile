FROM alpine:edge
RUN apk add --no-cache --virtual .build-deps curl bash grep \
  && curl -fsSL https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | sh \
  && apk del .build-deps
