pipeline {
	agent any
	stages {
		
		stage('Build') {
			steps {
				sh './mvnw package && java -jar target/gs-spring-boot-docker-0.1.0.jar'
			}
		}
		stage('Docker Build') {
      			agent any
      			steps {
        			sh 'docker build -t jordan14/b-safe:latest .'
    			  }
    		}
	}
}
