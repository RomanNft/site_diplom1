pipeline {
    agent any
    
    environment {
        finalImageTag = 'roman2447/site-diplom1-final'
    }
    
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
        
        stage('Create and Push Final Docker Image') {
            steps {
                script {
                    // Create final Docker image combining all components
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials-id') {
                        // Build the final image from the root directory
                        def finalImage = docker.build(finalImageTag, '.')
                        finalImage.push()
                    }
                }
            }
        }
    }
}
