pipeline {
 environment {
	registry = "jordao14/b-safe"
	registryCredential = 'dockerhub_cred'
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
    stage('Push docker image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage ('Deploy the application') {
      steps {
        sh "docker stack deploy b-safe --compose-file docker-compose.yml"
      }
    }
    stage ('Remove the container stack') {
      steps {
        sh "docker stack rm b-safe"
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
