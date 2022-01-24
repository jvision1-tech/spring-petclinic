pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    
    stages{
        stage('CDOWNLOAD'){
            steps{
                git credentialsId: 'Github_Token', 
                    url: 'https://github.com/ngengecharity/spring-petclinic.git'
            }
            
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
    }
}