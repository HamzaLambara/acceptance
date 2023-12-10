pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Package') {
            steps {
                sh './gradlew build'
            }
        }

        stage('Docker build') {
            steps {
                sh 'docker build -t calculator .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'docker push localhost:5000/calculator'
            }
        }

        stage('Déploiement sur staging') {
            steps {
                sh '''
                    docker ps -a | grep calculator && docker stop calculator || true
                    docker rm -f calculator || true
                    docker run -d --rm -p 8765:8080 --name calculator localhost:5000/calculator
                '''
            }
        }

        stage('Test d\'acceptation') {
            steps {
                script {
                    // Ajoutez une temporisation pour attendre que l'application soit disponible
                    sleep time: 2, unit: 'MINUTES'
                    sh 'chmod +x acceptance_test.sh && ./acceptance_test.sh'
                }
            }
        }
    }

    post {
        always {
            sh '''
                docker ps -a | grep calculator && docker stop calculator || true
                docker rm -f calculator || true
            '''
        }
    }
}


