pipeline {
    agent any

    stages {
        stage('Build BackEnd') {
            steps {
                dir('BackEnd/Amazon-clone') {
                    script {
                        def backendImage = docker.build('backend-image', '-f Dockerfile .')
                        backendImage.inside {
                            sh 'dotnet restore ShopApi/ShopApi.csproj'
                            sh 'dotnet build ShopApi/ShopApi.csproj -c Release -o /app/build'
                        }
                    }
                }
            }
        }
        
        stage('Build FrontEnd') {
            steps {
                dir('FrontEnd/my-app') {
                    script {
                        def frontendImage = docker.build('frontend-image', '-f Dockerfile .')
                        frontendImage.inside {
                            sh 'npm install'
                            sh 'npm run build'
                        }
                    }
                }
            }
        }
        
        stage('Run SQL Server') {
            steps {
                script {
                    docker.image('mcr.microsoft.com/mssql/server:latest').withRun('-e ACCEPT_EULA=Y -e SA_PASSWORD=YourStrong@Passw0rd -p 1433:1433') { c ->
                        sleep 30 // wait for SQL Server to start
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials-id') {
                        // Push backend image to Docker Hub
                        docker.image('backend-image').push()

                        // Push frontend image to Docker Hub
                        docker.image('frontend-image').push()
                    }
                }
            }
        }
    }
}
