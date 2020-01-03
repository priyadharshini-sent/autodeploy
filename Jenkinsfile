pipeline {

	  environment {
		PROJECT = "sentient-207310"
		APP_NAME = "autodeploy"
		FE_SVC_NAME = "${APP_NAME}-frontend"
		CLUSTER = "jenkins-cd"
		CLUSTER_ZONE = "us-east1-d"
		IMAGE_TAG = "gcr.io/${PROJECT}/${APP_NAME}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
		JENKINS_CRED = "${PROJECT}"
	  }
  
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
  stages {
    stage('Build and push image with Container Builder') {
      steps {
        container('gcloud') {
          sh "PYTHONUNBUFFERED=1 gcloud builds submit -t ${IMAGE_TAG} ."
        }
      }
    }
  }
}
