pipeline { 
    environment {
        registry = "pasqualematera/test-docker" 
        registryCredential = 'dockerhub' 
        dockerImage = ''
        // branch = 'main'
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
          steps {
                // git url:'https://github.com/pasquale1981/test-docker-build.git', branch: ":$BRANCH"
                git branch: 'main', url: 'https://github.com/pasquale1981/test-docker-build.git'
                // git 'https://github.com/pasquale1981/test-docker-build.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
