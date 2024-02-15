pipeline {
  agent any
  stages{
    stage('install docker'){
     steps{
       sh 'apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin'
     }
    }
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