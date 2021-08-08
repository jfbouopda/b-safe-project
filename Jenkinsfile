pipeline {
	environment {
		registry = "jordao14/b-safe"
		registryCredential = ‘docker-hub’
		dockerImage = ''
	}
  agent any
  stages {
    stage('Build') {
      steps {
	sh './mvnw package'
      }
    }
    stage('Building and run image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
