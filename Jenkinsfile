pipeline {
  agent any
  {
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
    }}
//   stages {
//     stage('Build') {
//       parallel {
//         stage('Build') {
//           steps {
//             sh 'echo "building the repo"'
//             sh 'pip install -r requirements.txt'
//           }
//         }
//       }
//     }
//
//     stage('Deploy')
//     {
//       steps {
//         echo "deploying the application"
//         sh "python app.py"
//       }
//     }
  }
}