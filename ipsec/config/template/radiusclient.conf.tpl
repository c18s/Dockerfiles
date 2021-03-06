## --- radius client ---
auth_order      radius
login_tries     4
login_timeout   60
nologin         /etc/nologin
issue           /etc/radiusclient/issue

## --- radius server ---
authserver      {{ RADIUS_ADDRESS }}:1812
acctserver      {{ RADIUS_ADDRESS }}:1813

servers         /etc/radiusclient/servers
dictionary      /etc/radiusclient/dictionary
login_radius    /usr/sbin/login.radius
seqfile         /var/run/radius.seq
mapfile         /etc/radiusclient/port-id-map
default_realm
radius_timeout  10
radius_retries  3
nas_identifier  l2tp

## --- local ---
login_local     /bin/login

## EOF
