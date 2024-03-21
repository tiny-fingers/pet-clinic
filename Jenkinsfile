pipeline {
//     agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}