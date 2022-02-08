pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerjenkins')
	}
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'github token', 
                  url: https://github.com/jvision1-tech/spring-petclinic.git
            }
        }
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
            
        }

		stage('Docker Build Petclinic') {

			steps {
				sh 'docker build -t $DOCKERUSER/spring-clinic:${BUILD_NUMBER}-dev .'
			}
		}

		stage('Login to Docker HUB') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push  $DOCKERUSER/spring-clinic:${BUILD_NUMBER}-dev'
			}
		}
        stage('Cleanup') {
            steps{
                sh "docker rmi $DOCKERUSER/spring-clinic:${BUILD_NUMBER}-dev"
            }
        }
        stage('CleanWorkSpace'){
            steps {
                cleanWs()
            }
        }
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
