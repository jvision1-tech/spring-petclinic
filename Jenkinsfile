pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        dir ("/var/lib/jenkins/workspace/spring-petclinic/")
        sh './mvn package'
      }
    }
  }
}