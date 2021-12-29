resource "aws_ssm_association" "vault" {
  name = "AWS-ApplyAnsiblePlaybooks"
  parameters = {
    SourceType   = "GitHub",
    SourceInfo   = <<EOT
{"owner":"danielpodwysocki",
"getOptions":"branch:main",
"repository" : "ansible"}
EOT
    PlaybookFile = "playbooks/deploy/aws-dev/test.yaml"
  }

  targets {
    key    = "InstanceIds"
    values = [aws_instance.vault1.id]
  }
}


