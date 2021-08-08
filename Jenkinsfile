pipeline {
	environment {
		registry = "jordao14/docker_jenkins_pipeline"
		registryCredential = 'docker_hub'
		dockerImage = ''
	}
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
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh './mvnw dockerPush'
            }
        }
	}
}
