## --- charon ---
charon {
  user = root
  load_modular = yes
  send_vendor_id = yes
  duplicheck.enable = yes
  plugins {
    include strongswan.d/charon/*.conf
    {% if ENABLE_RADIUS is defined %}
    eap-radius {
      accounting = yes
      accounting_interval = 60
      servers {
        radiusServer {
          secret = {{ RADIUS_SECRET }}
          address = {{ RADIUS_ADDRESS }}
        }
      }
      dae {
        enable = yes
        listen = 0.0.0.0
        port = 3799
        secret = {{ RADIUS_SECRET }}
      }
    }
    {% endif %}
  }
  ## --- dns ---
  dns1 = {{ DNS_SERVER1 }}
  dns2 = {{ DNS_SERVER2 }}
}
include strongswan.d/*.conf

## EOF
