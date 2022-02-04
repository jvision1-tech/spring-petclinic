pipeline{
    environment {
        registry = "jvision1/jvision1-tech"
        registryCredential = "docker-jenkins"
        dockerImage = ''
    }
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
        stage ('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }    
                }
             }
        } 
    }
}