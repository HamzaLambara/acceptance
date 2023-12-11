pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/HamzaLambara/acceptance.git']]])
            }
        }

        stage('Package') {
            steps {
                sh './gradlew build'
            }
        }

        stage('Docker build') {
            steps {
                script {
                    docker.build('calculator')
                }
            }
        }

        stage('Docker push') {
            steps {
                script {
                    docker push localhost:5000/calculator
                    }
                }
            }
        }

        stage('Déploiement sur staging') {
            steps {
                script {
                    docker.withRegistry('http://localhost:5000', 'docker-registry-credentials-id') {
                        def calculator = docker.image('calculator').start('-p 8888:8080 --name calculator')
                    }
                }
            }
        }

        stage('Test d\'acceptation') {
            steps {
                sleep(time: 1, unit: 'MINUTES')
                sh 'chmod +x acceptance_test.sh'
                sh './acceptance_test.sh http://localhost:8888'
            }
        }

        stage('Post Actions') {
            steps {
                script {
                    def calculator = docker.image('calculator')
                    calculator.stop()
                }
            }
        }
    }

    post {
        always {
            script {
                docker.image('calculator').remove()
            }
        }
    }
}

