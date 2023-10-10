pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-cloud')
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
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
            steps {
                echo 'Apply proceeding...'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -auto-aprove -no-color'
            }
        }
        // Destroy because this is a test
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-aprove -no-color'
            }
        }
    }
}