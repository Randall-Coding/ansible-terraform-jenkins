Example project using Ansible + Terraform + Jenkins for AWS infra deployment.

# Before use
export ANSIBLE_HOST_KEY_CHECKING=False
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

Add the following to playbooks:
  vars:
    ansible_ssh_common_args: '-o IdentitiesOnly=yes'
Or configure ansible cfg with:
  [defaults]
  ssh_args = -o IdentitiesOnly=yes

## Generate pem key
ssh-keygen -m PEM -b 4096  #MyAWSKey
mv MyAWSKey MyAWSKey.pem

# Use locally

## Monitor Server 
run terraform in main folder

## Jenkins
run terraform in jenkins folder