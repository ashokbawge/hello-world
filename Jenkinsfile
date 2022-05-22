pipeline {
    agent any
   
    
    tools{
        maven 'MY_MAVEN'

    }

    stages {
        stage('Git_clone') {
            steps {
                git credentialsId: 'GIT_HUB_ID', url: 'https://github.com/ashokbawge/hello-world.git'
            }
        }
    
        stage ('Maven_build'){
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage (' Upload War to Nexus') {
            steps{
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'simple-app', 
                        classifier: '', 
                        file: 'target/simple-app-3.0.0.war', 
                        type: 'war'
                    ]], 
                    credentialsId: 'Nexus_Credentials', 
                    groupId: 'in.javahome', 
                    nexusUrl: '100.0.0.50', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'http://100.0.0.50:8081/repository/simpleapp-release', 
                    version: '3.0.0'
        
            }  
         }     
        
        
        
    }
    
}
