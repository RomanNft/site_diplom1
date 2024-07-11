pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
    }

    stages {
        stage('Build Frontend') {
            steps {
                dir('FrontEnd/my-app') {
                    script {
                        def frontendImage = docker.build('frontend-image', '.')
                        docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                            frontendImage.push()
                        }
                    }
                }
            }
        }

        stage('Build Backend') {
            steps {
                dir('BackEnd/Amazon-clone') {
                    script {
                        def backendImage = docker.build('backend-image', '.')
                        docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                            backendImage.push()
                        }
                    }
                }
            }
        }

        stage('Build Database') {
            steps {
                dir('Database') {
                    script {
                        def databaseImage = docker.build('database-image', '.')
                        docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                            databaseImage.push()
                        }
                    }
                }
            }
        }
    }
}
