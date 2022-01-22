pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    
    stages{
        stage('CDOWNLOAD'){
            steps{
                git credentialsId: 'jenkinsfile', 
                    url: 'https://github.com/jvision1-tech/spring-petclinic.git'
            }
            
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
    }
}
