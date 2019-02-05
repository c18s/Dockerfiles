## --- pptpd option ---
name pptpd

## --- encrypt ---
refuse-eap
refuse-pap
require-chap
require-mschap
require-mppe-128
require-mschap-v2

## --- miscellaneous ---
auth
noccp
hide-password
lock
nobsdcomp
novj
novjccomp
nologfd

## --- network ---
proxyarp
nodefaultroute
ipcp-accept-local
ipcp-accept-remote
connect-delay 5000
lcp-echo-failure 10
lcp-echo-interval 60
ms-dns {{ DNS_SERVER1 }}
ms-dns {{ DNS_SERVER2 }}

{% if ENABLE_RADIUS is defined %}
## --- radius ---
plugin radius.so
plugin radattr.so
avpair NAS-Port-Id=1723
radius-config-file /etc/radiusclient/radiusclient.conf
{% endif %}

## EOF
