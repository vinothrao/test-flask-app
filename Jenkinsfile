pipeline {
    agent any
    stages {
        stage('Install Azure CLI'){
            steps{
                sh 'sudo apt-get update'
                sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
            }
        }
        stage('Install PIP'){
            steps{
                sh 'sudo apt-get install pip -y'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run flaskapp'){
            steps{
                sh 'python app.py'
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([
                                 string(credentialsId: 'AZURE_CLIENT_ID', variable: 'AZURE_CLIENT_ID'),
                                 string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'AZURE_CLIENT_SECRET'),
                                 string(credentialsId: 'AZURE_TENANT_ID', variable: 'AZURE_TENANT_ID'),
                                 string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'AZURE_SUBSCRIPTION_ID')]
                                 ) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                    sh 'az deploy'
                    sh 'chmod +x ./deploy/az-webapp-create-py.sh'
                    sh './deploy/az-webapp-create-py.sh -z . -b $BUILD_TAG'
                }
            }
        }
    }
}