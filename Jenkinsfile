node{
  stage('SCM Checkout'){
    git 'https://github.com/priyadharshini-sent/autodeploy.git'
  }

  stage('Complie and Package'){
    def mvnHome =  tool name: 'apache-maven-3.6.3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
  
  stage('Build Docker Image'){
   sh 'docker build -t priya1410/autodeploy:1.0.0 .'
  }
}
