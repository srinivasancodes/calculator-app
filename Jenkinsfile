pipeline {
    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'calculatorapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'srinivasancode')
    }

    stages {
        stage('Git Checkout'){
            steps{
             checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/srinivasancodes/calculator-app.git']]])
            }
        }
        /*stage('Clean Package') {
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
        stage('Quality Gate') {
            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to quality gate failure: ${qg.status}"
                    }
                }
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }*/
        stage('Build Docker Image') {
            steps {
                script {
                     sh """
                        docker image build -t ${params.DockerHubUser}/${params.ImageName}:latest .
                     """
                }
            }
       }
       /*stage('Pre-download Java DB') {
    steps {
        script {
            sh 'trivy --debug --download-java-db'
        }
    }
}*/
        stage('Docker Image Scan: trivy') {
    steps {
        script {
            sh """
                trivy --debug image ${params.DockerHubUser}/${params.ImageName}:latest > scan.txt
                cat scan.txt
            """
        }
    }
}
/*stage('Docker Image Push : DockerHub'){
    withCredentials([usernamePassword(
            credentialsId: "docker",
            usernameVariable: "USER",
            passwordVariable: "PASS"
    )]) {
        sh "docker login -u '$USER' -p '$PASS'"
    }
    //sh "docker image push ${params.DockerHubUser}/${project}:${ImageTag}"
    sh "docker image push ${params.DockerHubUser}/${params.ImageName}:latest"   
}*/
    stage('Docker Image Push : DockerHub') {
    withCredentials([usernamePassword(
            credentialsId: "docker",
            usernameVariable: "USER",
            passwordVariable: "PASS"
    )]) {
        /*sh "docker login -u \"$USER\" -p \"$PASS\"*/
        sh 'ls -ltr'
    }
    /*echo "DockerHubUser: ${params.DockerHubUser}"
    echo "ImageName: ${params.ImageName}"
    sh "docker image push ${params.DockerHubUser}/${params.ImageName}:latest"*/
}
    }
}

