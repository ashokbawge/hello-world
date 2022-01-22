pipeline {
    agent any
   
    
    tools{
        maven 'MVN'

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
        
    }
    
}
