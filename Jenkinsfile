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
        
        stage ('Docker_Build_image'){
            steps {
                sh ' docker build -t ashokbawge/jenkins_pipeline_demo:${BUILD_NUMBER} . '
            }
        }
        
        stage ('Docker push image') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_ID', variable: 'DOCKER_ID')]) {
                    sh ' docker login -u ashokbawge -p ${DOCKER_ID}'
                        }
                
                
                sh ' docker push ashokbawge/jenkins_pipeline_demo:${BUILD_NUMBER}  '
            }
        }
       
         stage ('Docker container creation'){
             steps {
                            sshagent(['Docker-server']) {
                            sh " ssh -o StrictHostKeyChecking = no vagrant@100.0.0.2 docker service rm javawebapp || true"
                            sh " ssh -o StrictHostKeyChecking = no vagrant@100.0.0.2 docker service create --name javawebapp -p 8082:8082 --replicas 2 ashokbawge/jenkins_pipeline_demo:${BUILD_NUMBER} "
                           }
             }
            
        }
        
        
    }
    
}
