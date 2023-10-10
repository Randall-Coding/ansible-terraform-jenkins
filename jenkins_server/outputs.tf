output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "ssh_jenkins" {
  value = "ssh -i ${var.my_aws_pem} ubuntu@${aws_instance.jenkins.public_ip} -o IdentitiesOnly=true"
}
