pipeline {
    agent any
    def buildNumber = BUILD_NUMBER
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/shailednrapali/welcome.git',branch: 'master'
            }
        }
        stage('Build Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
		
		stage("Build Docker Image") {
         steps {
		 sh "docker build -t wissenbaba/welcome:${buildNumber} ."
		 }
    }
		stage("Docker Login and Push Image in Docker Hub") {
		 steps {
          withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
           sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
		   }
     }
      sh "docker push  wissenbaba/welcome:${buildNumber} "
    }
  }
}
