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
		stage('Deploy Image') {
			steps{
    docker.withRegistry('https://registry.example.com', 'docker_hub') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
				}
			}
		}
	}
}
