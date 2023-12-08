pipeline {
    agent any
    stages {
        stage("Compilation") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        
        stage("Test unitaire") {
            steps {
                sh "./gradlew test"
            }
        }
        
        stage("Couverture du code") {
            steps {
                sh "./gradlew jacocoTestReport"
                
                publishHTML(target: [
                    reportDir: 'build/reports/jacoco/test/html',
                    reportFiles: 'index.html',
                    reportName: 'JaCoCo Report'
                ])
                
                sh "./gradlew jacocoTestCoverageVerification"
            }
        }
        
        stage("Analyse statique du code") {
            steps {
                sh "./gradlew checkstyleMain -Pcheckstyle.config=file:/home/calculator/config/checkstyle/checkstyle.xml"
                
                publishHTML(target: [
                    reportDir: 'build/reports/checkstyle/',
                    reportFiles: 'main.html',
                    reportName: 'Checkstyle Report'
                ])
            }
        }
    }
    post {
        always {
            mail to: 'lambara.hamza@gmail.com',
                 subject: "Cher lion, votre compilation est terminée: ${currentBuild.fullDisplayName}",
                 body: "Votre build est accompli. Veuillez vérifier: ${env.BUILD_URL}"
        }
    }
}


