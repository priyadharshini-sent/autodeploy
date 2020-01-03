node{
  stage('SCM Checkout'){
    git 'https://github.com/priyadharshini-sent/autodeploy.git'
  }

  stage('Complie and Package'){
    def mvnHome =  tool name: 'apache-maven-3.6.3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
}

pipeline {
  agent {
    kubernetes {
      label 'autodeploy'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: cd-jenkins
  containers:
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
    - name: m2
      persistentVolumeClaim:
        claimName: m2
"""
}
   }
  stages{
  stage('Push') {
      steps {
        container('docker') {
          sh """
             docker build -t autodeploy:$BUILD_NUMBER .
          """
        }
      }
    }
  }
 }
