pipeline {
	environment {
		registry = "jordao14/docker_jenkins_pipeline"
		registryCredential = 'docker_hub'
		dockerImage = ''
	}
	agent any
	tools {nodejs "node" }
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
		stage('Deploy Image') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
					dockerImage.push()
					}
				}
			}
		}
	}
}
