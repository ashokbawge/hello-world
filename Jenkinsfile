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
                        artifactId: 'webapp', 
                        classifier: '', 
                        file: 'webapp/target/web.war', 
                        type: 'war'
                    ]], 
                    credentialsId: 'Nexus_Credentials', 
                    groupId: 'com.example.maven-project', 
                    nexusUrl: '100.0.0.50:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'simpleapp-release', 
                    version: '*'
        
            }  
         }     
        
        
        
    }
    
}
