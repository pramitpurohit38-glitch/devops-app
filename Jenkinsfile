pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-credentials')
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

        stage('Login to Docker Hub') {
            steps {
                sh '''
                    echo "$DOCKERHUB_CREDS_PSW" | docker login -u "$DOCKERHUB_CREDS_USR" --password-stdin
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
            	    echo "Using Docker Hub user: $DOCKERHUB_CREDS_USR"

                    docker tag devops-flask-app:latest $DOCKERHUB_CREDS_USR/devops-flask-app:v1

                    docker push $DOCKERHUB_CREDS_USR/devops-flask-app:v1
                '''
           }
       }

    post {
        success {
            echo "🎉 Successfully pushed Docker Image"
        }
        failure {
            echo "❌ Failed! Check logs."
        }
    }
}
