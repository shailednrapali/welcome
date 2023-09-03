node{
    def buildNumber = BUILD_NUMBER
    stage("Git CheckOut"){
        git url: 'https://github.com/shailednrapali/welcome.git',branch: 'master'
    }

   
    stage("Maven Clean Package"){
      sh 'mvn clean package'
    }   

    
    stage("Build Docker Image") {
         sh "docker build -t wissenbaba/welcome:${buildNumber} ."
    }
    
    stage("Docker Login and Push Image in Docker Hub") {
        withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
           sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
     }
      sh "docker push  wissenbaba/welcome:${buildNumber} "
    }
}
          
