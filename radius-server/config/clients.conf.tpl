client public_ipv4 {
  ipaddr = 0.0.0.0
  secret = {{ .RADIUS_SECRET | default "1234" }}
  shortname = public
}
