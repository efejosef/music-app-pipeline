pipeline {
    agent any 

    environment {
        DOCKER_HUB_USER = '123ejiro'
        IMAGE_NAME      = 'music-app'
        IMAGE_TAG       = 'step6'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Creating production build directory...'
                sh 'mkdir -p dist/app'
                sh 'echo VERSION=6 > dist/app/config.properties'
            }
        }

        stage('Test') {
            steps {
                echo 'Verifying build structure...'
                sh 'test -f dist/app/config.properties'
            }
        }

        stage('Docker Build & Tag') {
            steps {
                echo 'Building and tagging the Docker image...'
                // Tags the image locally and prepares it with your Docker Hub handle
                sh "docker build -t ${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Docker Push to Hub') {
            steps {
                echo 'Logging into Docker Hub and pushing image...'
                // Securely injects your credentials to login and push
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
                    sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up local Docker credentials...'
            sh 'docker logout'
        }
    }
}
