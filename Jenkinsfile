pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Test') {
            steps {
                sh 'mvn clean package'
            }
        }

stage("Build Docker Image") {
    steps {

         sh "docker build -t wissenbaba/spc:${buildNumber} ."
    }
}
    
    stage("Docker Login and Push Image in Docker Hub") {
        steps 
        {
        withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
           sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
     }
      sh "docker push  wissenbaba/spc:${buildNumber} "
    }
}
}
}
