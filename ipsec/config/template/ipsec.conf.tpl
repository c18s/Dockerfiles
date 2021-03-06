## --- ipsec ---
config setup
    uniqueids=never
    charondebug="dmn 0, mgr 0, ike 0, chd 0, job 0, cfg 0, knl 0, net 0, asn 0, enc 0, lib 0, esp 0, tls 0, tnc 0, imc 0, imv 0, pts 0"

conn %default
    keylife=1h
    keyingtries=3
    ikelifetime=8h
    dpddelay=10s
    dpdtimeout=60s
    dpdaction=clear
    fragmentation=yes

conn IKE-Base
    leftcert=server.crt
    leftsendcert=always
    leftsubnet=0.0.0.0/0
    leftid=@{{ LEFT_ID }}
    rightsourceip={{ IKE_NETWORK }}

conn IKEv1-PSK-XAuth
    also=IKE-Base
    ike=aes128-sha1-modp1024
    keyexchange=ikev1
    leftauth=psk
    rightauth=psk
    rightauth2={{ RIGHT_AUTH2 }}
    auto=add

conn IKEv2-EAP-MSCHAPv2
    also=IKE-Base
    keyexchange=ikev2
    eap_identity=%any
    rightauth={{ RIGHT_AUTH }}
    auto=add

conn L2TP-IKEv1-PSK
    keyexchange=ikev1
    ike=aes128-sha1-modp1024
    esp=aes128-sha1-modp1024
    type=transport
    authby=secret
    leftprotoport=udp/l2tp
    rightprotoport=udp/%any
    auto=add

## EOF
