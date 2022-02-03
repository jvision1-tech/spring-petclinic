pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    
    stages{
        stage('Maven Build'){
            steps{
                sh "mvn clean package"


        stage('docker build image')
            steps{
                script (
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
    }
}