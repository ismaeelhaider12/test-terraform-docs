pipeline {
  agent any  
  stages {
        
    stage('Git') {
      steps {
        git branch: 'main', url: 'https://github.com/ismaeelhaider12/test-terraform-docs.git'
      }
    }
     
    stage('Build') {
      steps {
         sh "echo hello world ............ "
         sh "ls -la"
         sh "pwd"
      }
    }  

  }
}