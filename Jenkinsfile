pipeline {
    agent any

    environment {
        DOCKER_USER = credentials('dockerhub')
    }

    stages {

        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-flask-app:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    echo "Using Docker Hub user: $DOCKER_USER"
                    
                    echo $DOCKER_USER_PSW | docker login -u $DOCKER_USER_USR --password-stdin

                    docker tag devops-flask-app:latest $DOCKER_USER_USR/devops-flask-app:v1
                    
                    docker push $DOCKER_USER_USR/devops-flask-app:v1
                '''
            }
        }
    }
}
