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
      label 'ui-platform'
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
  - name: golang
    image: golang:1.10
    command:
    - cat
    tty: true
  - name: gcloud
    image: gcr.io/cloud-builders/gcloud
    command:
    - cat
    tty: true
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
"""
    }
  } 
}
