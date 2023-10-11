This is the Jenkins server configuration.  It is run separately from the app infrastructure configuration

### Steps to deploy
1) Place aws pem file in ansible_practice root directory
2) Deploy Jenkins server using terraform
3) See outputs for the server IP
4) Setup a multibranch pipeline
5) Configure Jenkins server with credentials
  - aws credentials as secret text
  - terraform cloud credentials as secret file
  - Github App credentials
6) Set up webhook on repo, pointing to <jenkins_ip><port>/github-webhook
   (https://plugins.jenkins.io/github/)