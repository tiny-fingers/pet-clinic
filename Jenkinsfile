pipeline {
    // agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t petclinic:latest .'
            }
            post {
                success {
                    echo 'Docker image built'
                }
            }
        }

//         stage('Deploy to EC2') {
//             steps {
//                 script {
//                     echo 'Deploying docker image to EC2'
//                     def dockerCmd = "docker run -p 8888:8888 -d petclinic:latest"
//                     sshagent(['ubuntu']) {
//                         sh "ssh -o StrictHostKeyChecking=no ubuntu@13.39.16.220 ${dockerCmd}"
//                     }
//                 }
//             }
//         }
    }
}
