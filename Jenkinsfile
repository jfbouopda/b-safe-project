pipeline {
	agent any
	stages {
		
		stage('Build') {
			steps {
				sh './mvnw package && java -jar target/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar'
			}
		}
	}
}
