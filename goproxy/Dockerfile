FROM alpine:edge
RUN apk add --no-cache --virtual .build-deps wget curl bash grep \
  && curl -L https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | bash \
  && apk del .build-deps
