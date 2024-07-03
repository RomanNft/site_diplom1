pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        DOCKER_HUB_REPO = 'roman2447'
    }
    stages {
        stage('Build Frontend') {
            steps {
                script {
                    docker.build("${env.DOCKER_HUB_REPO}/frontend", 'frontend/Dockerfile').push('latest')
                }
            }
        }
        stage('Build Backend') {
            steps {
                script {
                    docker.build("${env.DOCKER_HUB_REPO}/backend", 'backend/Dockerfile').push('latest')
                }
            }
        }
        stage('Build Database') {
            steps {
                script {
                    docker.build("${env.DOCKER_HUB_REPO}/database", 'database/Dockerfile').push('latest')
                }
            }
        }
    }
}

