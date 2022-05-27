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
         sh "ls -la"
         sh "pwd"
         sh "terraform --version"
         sh "terraform-docs --version"
         sh "pwd"
         sh "mkdir -p /home/ubuntu/.tfdocs.d/plugins "
         sh "mv tfdocs-format-template /home/ubuntu/.tfdocs.d/plugins"
         sh "who"
         sh "cd ./complianceX/jenkins_repo/test-terraform-docs/complianceX/aws/terraform/PCI/VPC/1.0"
         sh "pwd"
         sh "ls -la"
         sh "terraform-docs -c ./.terraform-docs.yaml ."
         sh "successfull"
      }
    }  

  }
}
