# infra


Terraform repository containing all of the infrastructure for dapo.tech and development purposes.


Most of the configuration is managed by Ansible and FluxCD in the below repositories:
- Ansible: https://gitlab.com/danielpodwysocki/ansible
- FluxCD - controls all of the Kubernets infrastracture: https://gitlab.com/danielpodwysocki/kube
# environments

## hetzner-prod

Production infrastracture on Hetzner Cloud - will contain services that cannot be brought up and torn down at will.
The hosts are managed via Ansible (playbooks/deploy/hetzner-prod.yaml) and the Kubernetes cluster on top is managed in the FluxCD repo (clusters/hetzner-prod)

## hetzner-dev

My test environment on Hetzner.

### direnv

For development purposes, you might want to load your HCLOUD_TOKEN dynamically.

This can be done safely via `direvn` - it will allow you to create a file with the environment variables and have it load whenever you're in the project repo - you can simply chmod it to `500` to make sure nobody has access to it.

`direnv` setup docs can be found here: https://github.com/direnv/direnv

It's been added to .gitignore to ensure it never gets commited. You can find an example .envrc file in `.envrc.example`.
To allow it to be loaded, you need to trust the directory. After you create you the .envrc and populate it, run the below:

```
direnv allow .
```

You can trust a directory automatically by adding it to your logon script, for example:
```
direnv allow ~/workspace/infra
```

Example entry in your .envrc file:
```
export TF_VAR_hcloud_token=<secret value>
```

It's recommended to encrypt this file at rest when you're not working on the repo.

## aws-dev

Development environment on AWS - can be torn up and brought down at will.
It's managed via AWS Systems Manager - it applies Ansible playbooks from this repo: 
(playbooks/deploy/aws-dev/*)


## oracle-prod

An environment for hosting a few small web apps, the most notable one being WikiJS containing my documentation.
WikiJs: https://wiki.dapo.tech/

Managed via Ansible (playbooks/deploy/oracle/oracle-prod.yaml)
