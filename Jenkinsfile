node{
  
  stage('SCM Checkout'){
    git 'https://github.com/priyadharshini-sent/ui-platform.git'
  }
  
  stage('Complie and Package'){
    def mvnHome =  tool name: 'apache-maven-3.6.3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
}
