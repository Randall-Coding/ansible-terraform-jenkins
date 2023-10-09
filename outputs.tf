output "grafaa_ips" {
  value = aws_instance.web_server.public_ip
}

output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "ssh_jenkins" {
  value = "ssh -i ${var.aws_jenkins_pem} ubuntu@${aws_instance.jenkins.public_ip} -o IdentitiesOnly=true"
}

output "ssh_grafana" {
  value = "ssh -i ${var.my_aws_pem} ubuntu@${aws_instance.web_server.public_ip} -o IdentitiesOnly=true"
}