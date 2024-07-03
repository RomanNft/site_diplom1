pipeline {
    agent any

    stages {
        stage('Build and Run Docker') {
            steps {
                script {
                    def dockerImage = docker.image('alpine')
                    dockerImage.pull()  // Опціонально: завантажуємо образ, якщо він не завантажений раніше
                    dockerImage.run('-v /:/mnt/host --rm -i alpine echo "Hello from Docker"')
                }
            }
        }
    }
}
