eap {
  default_eap_type = md5
  timer_expire     = 60
  ignore_unknown_eap_types = no
  cisco_accounting_username_bug = no
  max_sessions = ${max_requests}
  md5 {
  }
  leap {
  }
  gtc {
    auth_type = PAP
  }
  mschapv2 {
  }
}
