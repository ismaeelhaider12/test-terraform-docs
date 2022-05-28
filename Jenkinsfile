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
                echo 'Hello World'
                // whoami
                // mkdir -p ~/.tfdocs.d/plugins
                // mv tfdocs-format-template ~/.tfdocs.d/plugins

                script {
                    def browsers = ['chrome', 'firefox']
                    for (int i = 0; i < browsers.size(); ++i) {
                        echo "Testing the ${browsers[i]} browser"
                        whoami
                    }
                }
        }
    }  

  }
}
