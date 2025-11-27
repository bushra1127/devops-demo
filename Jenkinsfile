pipeline {
    agent any

    environment {
        DOCKERHUB = "dockerhub"
        IMAGE = "yourdockerhubusername/react-portfolio"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Login Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKERHUB, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                    }
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    sh "docker push ${IMAGE}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker stop portfolio || true"
                    sh "docker rm portfolio || true"
                    sh "docker run -d --name portfolio -p 80:80 ${IMAGE}:${BUILD_NUMBER}"
                }
            }
        }

    }
}
