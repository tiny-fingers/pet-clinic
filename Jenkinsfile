pipeline {
    // agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    agent any
    tools {
        maven 'maven'
//         docker 'docker'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                            success {
                                echo 'Now Archiving...'
                                archiveArtifacts artifacts: '**/target/*.jar'
                            }
                        }
        }
        stage('Deliver') {
                    steps {
                        script {
                            // Find the latest JAR file in the target directory
                            def latestJar = sh(script: 'ls -t target/*.jar | head -n 1', returnStdout: true).trim()
                            // Copy the latest JAR file to the EC2 instance
                            sh "scp -v -o StrictHostKeyChecking=no ${latestJar} ubuntu@13.39.16.220:/home/ubuntu"
                            // Run the JAR file on the EC2 instance
                            sh "sshpass ssh -o StrictHostKeyChecking=no ubuntu@13.39.16.220 'nohup java -jar /home/ubuntu/${latestJar} > /home/ubuntu/log.txt 2>&1 & echo \$! > /home/ubuntu/pid.file'"
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
