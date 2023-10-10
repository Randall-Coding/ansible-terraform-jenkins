This is the Jenkins server configuration.  It is run separately from the app infrastructure configuration

### Steps to deploy
1) Deploy Jenkins server using terraform
2) See outputs for the server IP
3) Setup a multibranch pipeline
4) Configure Jenkins server with credentials
  - aws credentials as secret text
  - terraform cloud credentials as secret file
  - Github App credentials
5) Set up webhook on repo, pointing to <jenkins_ip><port>/github-webhook
   (https://plugins.jenkins.io/github/)
6) scp the aws pem key to /home/ubuntu and configure TF_VAR variable for it's fullpath