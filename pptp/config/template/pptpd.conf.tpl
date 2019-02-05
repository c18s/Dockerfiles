option /etc/ppp/options.pptpd
pidfile /var/run/pptpd.pid
localip {{ PPTP_PRE_NETWORK }}.1
remoteip {{ PPTP_PRE_NETWORK }}.2-254