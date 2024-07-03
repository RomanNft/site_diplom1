pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials-id')
    }

    stages {
        stage('Clone repository') {
            steps {
                git url: 'https://github.com/RomanNft/site_diplom1.git', branch: 'master'
            }
        }
        stage('Build Frontend') {
            steps {
                script {
                    docker.build('frontend', 'frontend').push("${DOCKER_HUB_CREDENTIALS_USR}/frontend:latest")
                }
            }
        }
        stage('Build Backend') {
            steps {
                script {
                    docker.build('backend', 'backend').push("${DOCKER_HUB_CREDENTIALS_USR}/backend:latest")
                }
            }
        }
        stage('Build Database') {
            steps {
                script {
                    docker.build('database', 'database').push("${DOCKER_HUB_CREDENTIALS_USR}/database:latest")
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
