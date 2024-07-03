pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        JD_IMAGE = "roman2447/backend:latest"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/RomanNft/site_diplom1'
            }
        }

        stage('Build Backend') {
            steps {
                script {
                    echo "Building the backend..."
                    sh 'docker build -t $JD_IMAGE -f ./BackEnd/Amazon-clone/Dockerfile .'
                }
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // Add your test steps here
            }
        }

        stage('Push Backend') {
            steps {
                script {
                    echo "Pushing the Docker image..."
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                    sh 'docker push $JD_IMAGE'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the application..."
                // Add your deployment steps here
            }
        }
    }
}
