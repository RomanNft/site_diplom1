pipeline {
    agent any
    
    stages {
        stage('Build Backend') {
            steps {
                dir('BackEnd/Amazon-clone') {
                    script {
                        // Build backend Docker image
                        docker.build('roman2447/site-diplom1-backend')
                    }
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                dir('FrontEnd/my-app') {
                    script {
                        // Build frontend Docker image
                        docker.build('roman2447/site-diplom1-frontend')
                    }
                }
            }
        }
        
        stage('Build Database') {
            steps {
                dir('BackEnd/Amazon-clone') {
                    script {
                        // Build database Docker image from Dockerfile-db
                        docker.build('roman2447/site-diplom1-database', '-f Dockerfile-db .')
                    }
                }
            }
        }
        
        stage('Push Docker Images') {
            steps {
                script {
                    // Push all built Docker images to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
