output "grafaa_ips" {
  value = aws_instance.web_server.public_ip
}

output "ssh_grafana" {
  value = "ssh -i ${var.my_aws_pem} ubuntu@${aws_instance.web_server.public_ip} -o IdentitiesOnly=true"
}

output "application" {
  value = local.application
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public_subnets : s.id]
}

output "security_groups" {
  value = {
    "${aws_security_group.allow_ssh.name}" = aws_security_group.allow_ssh.id 
    "${aws_security_group.allow_jenkins.name}" = aws_security_group.allow_jenkins.id 
  }
}

output "ubuntu_id" {
  value = data.aws_ami.ubuntu.id
}
output "my_aws_pem" {
  value = var.my_aws_pem
}

output "aws_key_name" {
  value =  aws_key_pair.developer.key_name
}

output "aws_region" {
  value = var.aws_region
}