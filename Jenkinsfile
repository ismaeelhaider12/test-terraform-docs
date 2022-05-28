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
                sh  "mkdir -p ~/.tfdocs.d/plugins"
                sh  "mv tfdocs-format-template ~/.tfdocs.d/plugins"

                script {
                    def browsers = ["Aurora","Autoscaling","CodePipeline","DynamoDB","VPC"]
                    for (int i = 0; i < browsers.size(); ++i) {
                        sh "data=${browsers[i]}"
                        // sh "cd complianceX/aws/terraform/PCI/$data/1.0 && terraform-docs -c ./.terraform-docs.yml ."
                        echo "Testing the ${browsers[i]} browser"
                        sh "whoami"
                    }
                }
        }
    }  

  }
}
