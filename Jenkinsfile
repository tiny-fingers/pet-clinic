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
        stage('Run Docker image') {
            steps {
                sh 'docker -p 80:8090 --name pet-clinic -d run petclinic:latest'
            }
            post {
                success {
                    echo 'Docker image deployed'
                }
            }
        }
    }
}
