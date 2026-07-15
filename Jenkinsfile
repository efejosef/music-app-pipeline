pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                echo 'Creating production build directory...'
                sh 'mkdir -p dist/app'
                echo 'Generating application configuration file...'
                sh 'echo VERSION=6 > dist/app/config.properties'
            }
        }

        stage('Test') {
            steps {
                echo 'Verifying build structure and file integrity...'
                sh 'test -f dist/app/config.properties'
                echo 'File verification successful.'
            }
        }

        stage('Docker Package') {
            steps {
                echo 'Packaging application into Docker image...'
                // This builds your Dockerfile locally on your EC2 host using the files we just generated
                sh 'docker build -t music-app:step6 .'
            }
        }
    }
    
    post {
        success {
            echo 'Step 6 Pipeline Completed Successfully!'
        }
    }
}
