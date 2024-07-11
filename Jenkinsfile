pipeline {
    agent any

    environment {
        // Define Docker credentials
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        // Define Docker registry URL
        DOCKER_REGISTRY_URL = 'docker.io'
        // Define image names
        BACKEND_IMAGE = 'roman2447/site-diplom1-backend'
        FRONTEND_IMAGE = 'roman2447/site-diplom1-frontend'
        DATABASE_IMAGE = 'roman2447/site-diplom1-database'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend') {
            steps {
                dir('BackEnd/Amazon-clone') {
                    script {
                        // Build backend Docker image
                        docker.build(BACKEND_IMAGE)
                    }
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('FrontEnd/my-app') {
                    script {
                        // Build frontend Docker image
                        docker.build(FRONTEND_IMAGE)
                    }
                }
            }
        }

        stage('Build Database') {
            steps {
                dir('site_diplom1') {
                    script {
                        // Build database Docker image
                        docker.build(DATABASE_IMAGE, './Dockerfile')
                    }
                }
            }
        }

        stage('Push Docker Images') {
            steps {
                // Push built Docker images to Docker Hub
                script {
                    docker.withRegistry(DOCKER_REGISTRY_URL, DOCKERHUB_CREDENTIALS) {
                        docker.image(BACKEND_IMAGE).push()
                        docker.image(FRONTEND_IMAGE).push()
                        docker.image(DATABASE_IMAGE).push()
                    }
                }
            }
        }
    }
}
