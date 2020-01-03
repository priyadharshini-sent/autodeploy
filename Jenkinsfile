node{
  stage('SCM Checkout'){
    git 'https://github.com/priyadharshini-sent/autodeploy.git'
  }

  stage('Complie and Package'){
    def mvnHome =  tool name: 'apache-maven-3.6.3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
  
  stage('Build Docker Image'){
    def label = "docker-jenkins-${UUID.randomUUID().toString()}"
def home = "/home/jenkins"
def workspace = "${home}/workspace/build-docker-jenkins"
def workdir = "${workspace}/src/localhost/docker-jenkins/"
   sh 'docker build -t priya1410/autodeploy:1.0.0 .'
  }
}
