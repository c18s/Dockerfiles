DEFAULT	Framed-Protocol == PPP
  Framed-Protocol = PPP,
  Framed-Compression = Van-Jacobson-TCP-IP

DEFAULT	Hint == "CSLIP"
  Framed-Protocol = SLIP,
  Framed-Compression = Van-Jacobson-TCP-IP

DEFAULT	Hint == "SLIP"
  Framed-Protocol = SLIP

{{ if eq .DEBUG "1" }}
dev	Cleartext-Password := "1234"
  Reply-Message := "Username: %{User-Name}"
{{ end }}
