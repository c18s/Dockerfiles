## --- Secrets for authentication using CHAP ---
# client  server  secret  acceptable local IP addresses

{% if ENABLE_RADIUS is undefined %}
{{ USERNAME }}  *  {{ PASSWORD }}  *
{% endif %}

## EOF
