# Configure the AWS Provider
provider "aws" {
  region = local.app_output.aws_region
}

data "terraform_remote_state" "app" {
  backend = "remote"

  config = {
    organization = "randallcoding"
    workspaces = {
      name = "ansible-terraform-project"
    }
  }
}

locals {
  app_state = data.terraform_remote_state.app
  app_output = data.terraform_remote_state.app.outputs
}

# Jenkins server
resource "aws_instance" "jenkins" {
  ami           = local.app_output.ubuntu_id
  instance_type = "t2.micro"
  subnet_id     = local.app_output.public_subnet_ids[0]
  tags = {
    Name  = "Jenkins"
    Owner = "DevOps"
    App   = local.app_output.application
  }
  key_name = local.app_output.aws_key_name

  vpc_security_group_ids = [local.app_output.security_groups["allow_ssh"],local.app_output.security_groups["allow_jenkins"]]

  provisioner "local-exec" {
    command = "printf '[jenkins]\n${self.public_ip}' > jenkins_host"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "null_resource" "jenkins_install" {
  depends_on = [aws_instance.jenkins]
  provisioner "local-exec" {
    command = "ansible-playbook ./playbooks/jenkins.yml -i jenkins_host --private-key=${var.my_aws_pem} -u ubuntu"
  }
}