pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
	sh './mvnw package'
      }
    }
    stage('Building and run docker image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
