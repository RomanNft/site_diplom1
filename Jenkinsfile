pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        DOCKERHUB_REPO = 'roman2447'
    }
    stages {
        stage('Build Frontend') {
            steps {
                script {
                    sh 'docker build -t $DOCKERHUB_REPO/frontend:latest -f frontend/Dockerfile frontend/'
                }
            }
        }
        // Add stages for Build Backend and Build Database if required
    }
}
