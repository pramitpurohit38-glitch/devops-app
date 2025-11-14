pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/pramitpurohit38-glitch/devops-app.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-flask-app .'
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {

                    // Login
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                    // Tag Image
                    sh 'docker tag devops-flask-app $DOCKER_USER/devops-flask-app:v1'

                    // Push Image
                    sh 'docker push $DOCKER_USER/devops-flask-app:v1'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs!"
        }
    }
}
