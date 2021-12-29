# infra

Terraform repository containing all of the infrastructure for dapo.tech and development purposes.

# environments

## hetzner-prod

Production infrastracture on Hetzner Cloud - will contain services that cannot be brought up and torn down at will.
The configuration management is kept in this ansible repo (playbooks/deploy/hetzner-prod.yaml)

## aws-dev

Development environment on AWS - can be torn up and brought down at will.
It's managed via AWS Systems Manager - it applies Ansible playbooks from this repo: https://gitlab.com/danielpodwysocki/ansible
(playbooks/deploy/aws-dev/*)


