pipeline{
    agent any
    tools {
      maven 'Maven'
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerjenkins')
        DOCKERUSER='jvision1'
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
		 AWS_DEFAULT_REGION = ('us-east-1')
	}
    stages{
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
            
        }
		stage('Docker Build Petclinic') {

			steps {
				sh 'docker build -t $DOCKERUSER/spring-petclinic:${BUILD_NUMBER}-dev .'
			}
		}

		stage('Login to Docker HUB') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push  $DOCKERUSER/spring-petclinic:${BUILD_NUMBER}-dev'
			}
		}
		stage('deploy'){
			steps{
				sh "aws cloudformation create-stack --stack-name spring-petclinic${BUILD_NUMBER} --region 'us-east-1' --template-body file://infrastructure.yaml --parameters ParameterKey=KeyName,ParameterValue=test"
			}
		}
        stage('Cleanup') {
            steps{
                sh "docker rmi $DOCKERUSER/spring-petclinic:${BUILD_NUMBER}-dev"
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
