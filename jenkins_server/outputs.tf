output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "scp_jenkins" {
    value = "scp -o IdentitiesOnly=true -i ${var.my_jenkins_pem} ${var.my_jenkins_pem} ubuntu@${aws_instance.jenkins.public_ip}:/var/lib/jenkins/MyAWSKey.pem"
}

output "ssh_jenkins" {
  value = "ssh -i ${var.my_jenkins_pem} ubuntu@${aws_instance.jenkins.public_ip} -o IdentitiesOnly=true"
}
