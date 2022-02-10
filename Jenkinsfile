pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhubtoken')
	}
    stages{

        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
            
        }

		stage('Build') {

			steps {
				sh 'docker build -t charityngenge/spring-petclinic:${BUILD_NUMBER}-dev .'
			}
		}

		stage('Login') {

			steps {

				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push  charityngenge/spring-petclinic:${BUILD_NUMBER}-dev'
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