pipeline {
    agent any

    stages {
        stage('Підготовка') {
            steps {
                script {
                    // Оновлення списків пакетів
                    sh 'apt-get update'

                    // Встановлення Docker
                    sh 'apt-get install -y docker.io'

                    // Перевірка версії Docker
                    sh 'docker --version'
                }
            }
        }

        stage('Збірка та запуск Docker') {
            steps {
                script {
                    // Перевірка доступності Docker після встановлення
                    sh 'which docker'

                    // Виконання команди pull та запуск контейнера
                    sh 'docker pull alpine'
                    sh 'docker run -v /:/mnt/host --rm -i alpine echo "Hello from Docker"'
                }
            }
        }
    }
}
