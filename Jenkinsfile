pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    
    stages{
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
            
        }
        
        stage('Build Docker Image'){
            steps{
                 script {
                  app = docker.build("spring-petclinic:${env.BUILD_ID}" )
                }
            }
        }
    }
}