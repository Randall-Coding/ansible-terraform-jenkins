Example project using Ansible + Terraform on AWS.

# Before use
export ANSIBLE_HOST_KEY_CHECKING=False

Add the following to the playbook:
  vars:
    ansible_ssh_common_args: '-o IdentitiesOnly=yes'
Or configure the ansible cfg with:
  [defaults]
  ssh_args = -o IdentitiesOnly=yes

