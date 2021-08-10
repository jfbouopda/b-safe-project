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
        input "Ready to deploy?"
        sh "docker stack deploy b-safe --compose-file docker-compose.yml"
        sh "docker service update b-safe_server --image jordao14/b-safe:v${env.BUILD_ID}"
      }
    }
  }
}
