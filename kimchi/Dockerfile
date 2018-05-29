FROM debian:9 as builder

ARG DEBIAN_FRONTEND=noninteractive

ENV WORKDIR /opt/kimchi
WORKDIR ${WORKDIR}

ARG GIT_BRANCH=master
ARG PLUGINS_DIR=${WORKDIR}/wok/src/wok/plugins
ARG DIST_DIR=${WORKDIR}/dist

RUN apt-get update && apt-get -y install python-apt sosreport python-configobj python-parted \
  gcc make autoconf automake gettext \
  git pkgconf xsltproc logrotate \
  python-cherrypy3 python-cheetah python-pam \
  python-m2crypto python-jsonschema \
  python-psutil python-ldap python-lxml nginx \
  openssl websockify novnc python-libvirt \
  libvirt-daemon nfs-common qemu-kvm \
  python-ethtool sosreport python-ipaddr \
  python-lxml open-iscsi python-guestfs \
  libguestfs-tools spice-html5 python-magic \
  python-paramiko python-imaging fonts-font-awesome \
  hddtemp libuser1 python-augeas python-libuser

RUN git clone --recursive https://github.com/kimchi-project/wok.git

RUN mkdir -p ${DIST_DIR}
RUN cd ${WORKDIR}/wok \
  && git checkout ${GIT_BRANCH} \
  && git submodule update --remote

RUN cd ${WORKDIR}/wok \
  && ./autogen.sh --system \
  && make >/dev/null \
  && make deb >/dev/null \
  && cp -v ${WORKDIR}/wok/wok-*.noarch.deb ${DIST_DIR}/wok.noarch.deb

RUN cd ${PLUGINS_DIR}/gingerbase \
  && ./autogen.sh --system \
  && make >/dev/null \
  && make deb >/dev/null \
  && cp -v ${PLUGINS_DIR}/gingerbase/ginger-base-*.noarch.deb \
  ${DIST_DIR}/ginger-base.noarch.deb

RUN cd ${PLUGINS_DIR}/ginger \
  && ./autogen.sh --system \
  && make >/dev/null \
  && make deb >/dev/null \
  && cp -v ${PLUGINS_DIR}/ginger/ginger-*.noarch.deb \
  ${DIST_DIR}/ginger.noarch.deb

RUN cd ${PLUGINS_DIR}/kimchi \
  && ./autogen.sh --system \
  && make >/dev/null \
  && make deb >/dev/null \
  && cp -v ${PLUGINS_DIR}/kimchi/kimchi-*.noarch.deb \
  ${DIST_DIR}/kimchi.noarch.deb

FROM debian:9

ARG DEBIAN_FRONTEND=noninteractive

ENV WORKDIR /opt/kimchi
WORKDIR ${WORKDIR}

COPY bin/. /usr/local/bin/
COPY config/supervisord.conf /etc/supervisord.conf
COPY ssl /etc/wok
COPY --from=builder /opt/kimchi/dist .

EXPOSE 8001

RUN docker-init

CMD ["entrypoint"]
