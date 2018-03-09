; --- xl2tpd ---
[global]
port = 1701

[lns default]
ip range = {{ L2TP_PRE_NETWORK }}.2-{{ L2TP_PRE_NETWORK }}.254
local ip = {{ L2TP_PRE_NETWORK }}.1
length bit = yes
require authentication = yes
pppoptfile = /etc/ppp/options.xl2tpd

; EOF
