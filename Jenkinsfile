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
         sh "terraform --version"
         sh "terraform-docs --version"
         sh "ls -la"
         sh "pwd"
         sh "mkdir -p ~/.tfdocs.d/plugins "
         sh "mv tfdocs-format-template ~/.tfdocs.d/plugins"
         sh "whoami"
         sh "ls"
         sh "cd complianceX/aws/terraform/PCI/VPC/1.0 && terraform-docs -c ./.terraform-docs.yml ."
         sh "pwd"
         sh "ls -la"
         sh "echo successfull"
      }
    }  

  }
}
