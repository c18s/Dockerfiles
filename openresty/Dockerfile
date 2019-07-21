FROM alpine:3.9
ARG RESTY_VERSION="1.15.8.1"
ARG RESTY_LUAROCKS_VERSION="3.1.3"
ARG RESTY_OPENSSL_VERSION="1.1.1c"
ARG RESTY_SREGEX_VERSION="0.0.1"
ARG RESTY_REPLACE_FILTER_VERSION="0.01rc5"
ARG RESTY_PCRE_VERSION="8.42"
ARG RESTY_J="4"
ARG RESTY_CONFIG_OPTIONS="\
  --with-file-aio \
  --with-http_addition_module \
  --with-http_auth_request_module \
  --with-http_dav_module \
  --with-http_flv_module \
  --with-http_geoip_module=dynamic \
  --with-http_gunzip_module \
  --with-http_gzip_static_module \
  --with-http_image_filter_module=dynamic \
  --with-http_mp4_module \
  --with-http_random_index_module \
  --with-http_realip_module \
  --with-http_secure_link_module \
  --with-http_slice_module \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-http_sub_module \
  --with-http_v2_module \
  --with-http_xslt_module=dynamic \
  --with-mail \
  --with-mail_ssl_module \
  --with-md5-asm \
  --with-pcre-jit \
  --with-sha1-asm \
  --with-stream \
  --with-stream_ssl_module \
  --with-threads \
  --add-module=/usr/src/replace-filter-nginx-module \
  "
ARG RESTY_CONFIG_OPTIONS_MORE=""
ARG _RESTY_CONFIG_DEPS="--with-openssl=/tmp/openssl-${RESTY_OPENSSL_VERSION} --with-pcre=/tmp/pcre-${RESTY_PCRE_VERSION}"

RUN apk add --no-cache --virtual .build-deps \
  gd-dev \
  geoip-dev \
  libxslt-dev \
  perl-dev \
  readline-dev \
  zlib-dev \
  && apk add --no-cache \
  tzdata \
  bash \
  build-base \
  curl \
  gd \
  geoip \
  libgcc \
  libxslt \
  linux-headers \
  make \
  perl \
  unzip \
  zlib \
  sed \
  openssl \
  && curl -fSL https://github.com/openresty/sregex/archive/v${RESTY_SREGEX_VERSION}.tar.gz -o sregex-v${RESTY_SREGEX_VERSION}.tar.gz \
  && tar zxf sregex-v${RESTY_SREGEX_VERSION}.tar.gz \
  && mkdir -p /usr/src && mv sregex-${RESTY_SREGEX_VERSION} /usr/src/sregex \
  && rm sregex-v${RESTY_SREGEX_VERSION}.tar.gz \
  && cd /usr/src/sregex \
  && make \
  && make install \
  && cd /usr/src \
  && rm -rf /usr/src/sregex \
  && curl -fSL https://github.com/openresty/replace-filter-nginx-module/archive/v${RESTY_REPLACE_FILTER_VERSION}.tar.gz -o replace-filter-nginx-v${RESTY_REPLACE_FILTER_VERSION}.tar.gz \
  && tar zxf replace-filter-nginx-v${RESTY_REPLACE_FILTER_VERSION}.tar.gz \
  && mv replace-filter-nginx-module-${RESTY_REPLACE_FILTER_VERSION} replace-filter-nginx-module \
  && rm -rf replace-filter-nginx-v${RESTY_REPLACE_FILTER_VERSION}.tar.gz \
  && cd /tmp \
  && curl -fSL https://www.openssl.org/source/openssl-${RESTY_OPENSSL_VERSION}.tar.gz -o openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
  && tar xzf openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
  && curl -fSL https://ftp.pcre.org/pub/pcre/pcre-${RESTY_PCRE_VERSION}.tar.gz -o pcre-${RESTY_PCRE_VERSION}.tar.gz \
  && tar xzf pcre-${RESTY_PCRE_VERSION}.tar.gz \
  && curl -fSL https://openresty.org/download/openresty-${RESTY_VERSION}.tar.gz -o openresty-${RESTY_VERSION}.tar.gz \
  && tar xzf openresty-${RESTY_VERSION}.tar.gz \
  && cd /tmp/openresty-${RESTY_VERSION} \
  && if [[ "1.1.1" == $(echo -e "${RESTY_OPENSSL_VERSION}\n1.1.1" | sort -V | head -n1) ]] ; then \
  echo 'patching Nginx for OpenSSL 1.1.1' \
  && cd bundle/nginx-1.15.8 \
  && curl -s https://raw.githubusercontent.com/openresty/openresty/master/patches/nginx-1.15.8-ssl_cert_cb_yield.patch | patch -p1 \
  && curl -s https://raw.githubusercontent.com/openresty/openresty/master/patches/nginx-1.15.8-ssl_sess_cb_yield.patch | patch -p1 \
  && cd ../.. ; \
  fi \
  && ./configure -j${RESTY_J} ${_RESTY_CONFIG_DEPS} ${RESTY_CONFIG_OPTIONS} ${RESTY_CONFIG_OPTIONS_MORE} \
  && make -j${RESTY_J} \
  && make -j${RESTY_J} install \
  && cd /tmp \
  && rm -rf \
  openssl-${RESTY_OPENSSL_VERSION} \
  openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
  openresty-${RESTY_VERSION}.tar.gz openresty-${RESTY_VERSION} \
  pcre-${RESTY_PCRE_VERSION}.tar.gz pcre-${RESTY_PCRE_VERSION} \
  && curl -fSL https://github.com/luarocks/luarocks/archive/${RESTY_LUAROCKS_VERSION}.tar.gz -o luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && tar xzf luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && cd luarocks-${RESTY_LUAROCKS_VERSION} \
  && ./configure \
  --prefix=/usr/local/openresty/luajit \
  --with-lua=/usr/local/openresty/luajit \
  --lua-suffix=jit-2.1.0-beta3 \
  --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
  && make build \
  && make install \
  && cd /tmp \
  && rm -rf luarocks-${RESTY_LUAROCKS_VERSION} luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && apk add --no-cache --virtual .gettext gettext \
  && mv /usr/bin/envsubst /tmp/ \
  && runDeps="$( \
  scanelf --needed --nobanner /tmp/envsubst \
  | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
  | sort -u \
  | xargs -r apk info --installed \
  | sort -u \
  )" \
  && apk add --no-cache --virtual $runDeps \
  && apk del .build-deps .gettext \
  && mv /tmp/envsubst /usr/local/bin/ \
  && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
  && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log \
  && ln -sf /usr/local/openresty/nginx /usr/share/nginx

# Add additional binaries into PATH for convenience
ENV PATH=$PATH:/usr/local/openresty/luajit/bin:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin

# Copy nginx configuration files
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

CMD ["openresty", "-g", "daemon off;"]

# Use SIGQUIT instead of default SIGTERM to cleanly drain requests
# See https://github.com/openresty/docker-openresty/blob/master/README.md#tips--pitfalls
STOPSIGNAL SIGQUIT