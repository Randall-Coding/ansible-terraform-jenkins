pipeline {
    agent any

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