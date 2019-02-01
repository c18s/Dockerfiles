DEFAULT
  EAP-Message =* ANY,
  State =* ANY,
  Message-Authenticator =* ANY,
  Error-Cause =* ANY,
  MS-CHAP-Error =* ANY,
  Proxy-State =* ANY,
  User-Password !* ANY,
  Reply-Message := "Username: %{User-Name}, Authentication failed"
