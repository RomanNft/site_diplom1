pipeline {
    agent any
    
    environment {
        combinedImage = ''
    }
    
    stages {
        stage('Build Combined Image') {
            steps {
                script {
                    // Build combined Docker image
                    combinedImage = docker.build('roman2447/site-diplom1-combined')
                }
            }
        }
        
        stage('Push Combined Image') {
            steps {
                script {
                    // Push combined Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials-id') {
                        combinedImage.push()
                    }
                }
            }
        }
    }
}
