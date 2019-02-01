server default {
  listen {
    type = auth
    ipaddr = {{ .IPADDR | default "*" }}
    port = 0
    limit {
      lifetime = 0
      idle_timeout = 30
      max_connections = 0
    }
  }
  listen {
    ipaddr = {{ .IPADDR | default "*" }}
    port = 0
    type = acct
    limit {
      lifetime = 0
      idle_timeout = 30
      max_connections = 0
    }
  }
  authorize {
    filter_username
    preprocess
    chap
    mschap
    digest
    suffix
    files
    if (!&reply:Reply-Message) {
      external_authorize
      if(ok) {
        update control {
          Reply-Message := &reply:Reply-Message
          Cleartext-Password := &reply:User-Password
        }
        update reply {
          User-Password !* ANY
        }
      }
    }
    expiration
    logintime
    pap
    eap
  }
  authenticate {
    Auth-Type PAP {
      pap
    }
    Auth-Type CHAP {
      chap
    }
    Auth-Type MS-CHAP {
      mschap
    }
    mschap
    digest
    eap
  }
  preacct {
    preprocess
    acct_unique
    suffix
    files
  }
  accounting {
    detail
    unix
    exec
    attr_filter.accounting_response
  }
  session {
  #	radutmp
  #	sql
  }
  post-auth {
    update {
      &reply: += &session-state:
    }
    exec
    Post-Auth-Type REJECT {
      attr_filter.access_reject
      remove_reply_message_if_eap
    }
  }
}
