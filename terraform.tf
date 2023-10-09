terraform {
  required_version = ">=1.5.7" #originally made with 1.5.7
  required_providers {
    tls = "3.1.0"
  }

  cloud {
    organization = "randallcoding"
    workspaces {
      name = "ansible-terraform-project"
    }
  }
}