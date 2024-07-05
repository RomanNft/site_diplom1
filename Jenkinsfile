pipeline {
    agent any
    environment {
        DOCKERHUB_REPO = 'roman2447'
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials-id'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/RomanNft/site_diplom1.git', branch: 'master'
            }
        }
        stage('Build Frontend') {
            steps {
                script {
                    dockerImage = docker.build("$DOCKERHUB_REPO/frontend:latest", "frontend/Dockerfile")
                }
            }
        }
        stage('Build Backend') {
            steps {
                script {
                    dockerImage = docker.build("$DOCKERHUB_REPO/backend:latest", "backend/Dockerfile")
                }
            }
        }
        stage('Build Database') {
            steps {
                script {
                    dockerImage = docker.build("$DOCKERHUB_REPO/database:latest", "database/Dockerfile")
                }
            }
        }
        stage('Push Images') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "$DOCKERHUB_CREDENTIALS") {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
