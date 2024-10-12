pipeline {
    agent any
    stages {
        stage('Git Checkout'){
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/srinivasancodes/calculator-app.git"
            )
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar-api') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
/*        stage('Build Docker Image') {
#            steps {
#                script {
#                    docker.build('calculator-app')
#                }
            }
       }*/
    }
}

