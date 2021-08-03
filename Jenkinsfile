pipeline {
	agent any
	stages {
		
		stage('compile') {
			steps {
				sh 'mvn compile'
			}
		}
		stage('Unit test') {
			steps {
				sh 'mvn test'
			}
		}
		stage('Docker Build') {
      			agent any
      			steps {
				sh 'mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)'
        			sh 'docker build -t jordan14/b-safe:latest .'
    			  }
    		}
	}
}
