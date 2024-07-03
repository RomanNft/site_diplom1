pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-docker-hub-creds') // Jenkins credentials ID
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the backend...'
                script {
                    docker.build("roman2447/backend:${DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test commands here, e.g., docker-compose, npm test, etc.
            }
        }

        stage('Push') {
            steps {
                echo 'Pushing the backend image to Docker Hub...'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.push("roman2447/backend:${DOCKER_IMAGE_TAG}")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the backend...'
                // Add deployment steps here, e.g., docker-compose up -d, kubectl apply, etc.
            }
        }
    }
}
