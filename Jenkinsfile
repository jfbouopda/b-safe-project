pipeline {
	agent any
	stages {
		
		stage('Build') {
			steps {
				sh './mvnw package'
			}
		}
		stage('Docker image build') {
      			agent any
      			steps {
        			sh 'docker build -t jordan14/b-safe:latest .'
				sh 'docker run -p 8080:8080 jordan14/b-safe'
    			  }
    		}
	}
}
