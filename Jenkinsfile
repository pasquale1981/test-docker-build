pipeline {
    agent {
        docker {
            label 'docker-agent'
            image 'jenkins/jnlp-agent-docker'
        }
    }
    environment {
        registry = "pasqualematera/test-docker" 
        registryCredential = 'dockerhub' 
        dockerImage = ''
    }
    stages { 
        stage('Cloning our Git') { 
          steps {
                sh "echo 'Clono il repo!'"
                // git branch: 'main', url: 'https://github.com/pasquale1981/test-docker-build.git'
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    sh "echo 'Ho buildato!'"
                    // dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    sh "echo 'Ho pushato!'"
                   // docker.withRegistry( '', registryCredential ) { 
                   //     dockerImage.push() 
                   // }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "echo 'Ho pulito!'"
                // sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
