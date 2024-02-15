pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'echo "building the repo"'
            sh 'pip install -r requirements.txt'
          }
        }
      }
    }

    stage('Deploy')
    {
      steps {
        echo "deploying the application"
        sh "python app.py"
      }
    }
  }
}