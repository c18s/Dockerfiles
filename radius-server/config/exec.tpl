exec {
  wait = no
  input_pairs = request
  shell_escape = yes
  timeout = 10
}

exec external_authorize {
  wait = yes
  program = "/usr/local/bin/external-authorize"
  input_pairs = request
  output_pairs = reply
  shell_escape = yes
}
