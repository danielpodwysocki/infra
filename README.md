# infra


Terraform repository containing all of the infrastructure for dapo.tech and development purposes.


Most of the configuration is managed by Ansible and FluxCD in the below repositories:
- Ansible: https://gitlab.com/danielpodwysocki/ansible
- FluxCD - controls all of the Kubernets infrastracture: https://gitlab.com/danielpodwysocki/kube
# environments

## hetzner-prod

Production infrastracture on Hetzner Cloud - will contain services that cannot be brought up and torn down at will.
The hosts are managed via Ansible (playbooks/deploy/hetzner-prod.yaml) and the Kubernetes cluster on top is managed in the FluxCD repo (clusters/hetzner-prod)

## aws-dev

Development environment on AWS - can be torn up and brought down at will.
It's managed via AWS Systems Manager - it applies Ansible playbooks from this repo: 
(playbooks/deploy/aws-dev/*)


## oracle-prod

An environment for hosting a few small web apps, the most notable one being WikiJS containing my documentation.
WikiJs: https://wiki.dapo.tech/

Managed via Ansible (playbooks/deploy/oracle/oracle-prod.yaml)
