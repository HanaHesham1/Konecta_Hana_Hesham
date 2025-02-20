# Ansible Task Solution

## Setup
- Created three machines: Control, Frontend, Docker.
- Configured SSH access.
- Defined Ansible inventory.

## Running Playbooks
```sh
ansible-playbook -i inventory.ini frontend.yml
ansible-playbook -i inventory.ini docker.yml
