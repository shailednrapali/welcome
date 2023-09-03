node{
    def buildNumber = BUILD_NUMBER
    stage("Git CheckOut"){
        git url: 'https://https://github.com/shailednrapali/welcome.git',branch: 'master'
    }
    
        stage('Build and Test') {
               sh 'mvn clean package'
            }
    stage("Build Docker Image") {
         sh "docker build -t wissenbaba/spc:${buildNumber} ."
    }
    
    stage("Docker Login and Push Image in
Docker Hub") {
        withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
           sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
     }
      sh "docker push  wissenbaba/spc:${buildNumber} "
    }
}
          
