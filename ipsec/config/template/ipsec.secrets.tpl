## --- keys ---
: RSA server.key
: PSK "{{ PSK }}"

{% if ENABLE_RADIUS is undefined %}
## --- users ---
{{ USERNAME }} : EAP "{{ PASSWORD }}"
{{ USERNAME }} : XAUTH "{{ PASSWORD }}"
{% endif %}

## EOF
