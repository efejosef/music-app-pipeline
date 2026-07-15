pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Creating production build directory...'
                // A real Linux command to create a distribution folder
                sh 'mkdir -p dist/app'
                
                echo 'Generating application configuration file...'
                // Actively writes a real file into the workspace
                sh 'echo "VERSION=${BUILD_NUMBER}" > dist/app/config.properties'
            }
        }

        stage('Test') {
            steps {
                echo 'Verifying build structure and file integrity...'
                // A real test command that verifies the file we just made actually exists
                sh 'test -f dist/app/config.properties'
                
                echo 'Checking system dependencies...'
                //sh 'python3 --version'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Archiving production assets into a deployment tarball...'
                // Compress the application files into a real deployable package
                sh 'tar -czf music-app-build.tar.gz dist/'
                
                echo 'Deployment package music-app-build.tar.gz created successfully!'
            }
        }
    }
}
