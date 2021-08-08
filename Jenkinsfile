pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
	sh './mvnw package'
      }
    }
    stage('Docker image build and run') {
      agent any
      steps {
        sh 'docker build -t jordan14/b-safe:latest .'
      }
    }
  }
}
