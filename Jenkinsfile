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
                    sh "docker build -t $DOCKERHUB_REPO/frontend:latest -f frontend/Dockerfile frontend/"
                }
            }
        }
        stage('Build Backend') {
            steps {
                script {
                    sh "docker build -t $DOCKERHUB_REPO/backend:latest -f backend/Dockerfile backend/"
                }
            }
        }
        stage('Build Database') {
            steps {
                script {
                    sh "docker build -t $DOCKERHUB_REPO/database:latest -f database/Dockerfile database/"
                }
            }
        }
        stage('Push Images') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_CREDENTIALS') {
                        sh "docker push $DOCKERHUB_REPO/frontend:latest"
                        sh "docker push $DOCKERHUB_REPO/backend:latest"
                        sh "docker push $DOCKERHUB_REPO/database:latest"
                    }
                }
            }
        }
    }
}
