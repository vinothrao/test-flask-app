pipeline {
  agent any
  stages{
    stage('build docker image'){
        steps{
            sh 'docker build -t jenkinssachintestregistry.azurecr.io/test-flask-app .'
        }
    }
    stage('push image'){
        steps{
            withCredentials([usernamePassword(credentialsId: 'ACR', passwordVariable: 'password', usernameVariable: 'username')]) {
            sh 'docker login -u ${username} -p ${password} jenkinssachintestregistry.azurecr.io'
            sh 'docker push jenkinssachintestregistry.azurecr.io/test-flask-app'
            }
        }
    }
  }
}