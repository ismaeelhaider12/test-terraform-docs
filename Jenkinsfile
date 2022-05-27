pipeline {
  agent any
  tools {
    terraform 'terraform-11'
  }
  stages {
    stage('Git') {
      steps {
        git branch: 'main', url: 'https://github.com/ismaeelhaider12/test-terraform-docs.git'
      }
    }
     
    stage('Build') {
      steps {
         sh "echo hello world  ............ "
         sh "whoami"
         sh "cd ~ && pwd && ls -la"
         sh "echo upper is directory"
         sh "echo entering jenkins"
         sh "sudo su -s /bin/bash jenkins"
         sh "ls -la"
         sh "pwd"
         sh "terraform --version"
         sh "terraform-docs --version"
         sh "pwd"
         sh "mkdir -p /home/ubuntu/.tfdocs.d/plugins "
         sh "mv tfdocs-format-template /home/ubuntu/.tfdocs.d/plugins"
         sh "who"
         sh "ls"
         sh "cd complianceX/aws/terraform/PCI/VPC/1.0 && terraform-docs -c ./.terraform-docs.yml ."
         sh "pwd"
         sh "ls -la"
         sh "echo successfull"
      }
    }  

  }
}
