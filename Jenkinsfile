pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-cloud')
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
        TF_VAR_my_aws_pem = '/var/lib/jenkins/MyAWSKey.pem'
        TF_VAR_my_jenkins_pem = '/var/lib/jenkins/MyAWSKey.pem'
        TF_VAR_var.my_aws_pub = credentials('my-aws-pub')
    }
    stages {
        stage('Init') {
            steps {
                sh 'terraform init -no-color'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -no-color'
            }
        }
        stage('Apply Confirm') {
            input {
                message "Apply Confirmation"
                ok "Apply changes"
            }            
            steps {
                echo 'Apply proceeding...'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve -no-color'
            }
        }
        // Destroy because this is a test
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve -no-color'
            }
        }
    }
}