pipeline {
    agent any

    environment {
        SONARQUBE_SCANNER_HOME = tool 'sonar-scanner'
        IMAGE_NAME = 'netflix-clone'
        IMAGE_TAG = 'security-gate'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'pre-production-security-gate',
                    url: 'https://github.com/hrishikaverma/Netflix-DevSecops.git'
            }
        }

        stage('Node Version Check') {
            steps {
                bat 'node -v'
                bat 'npm -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build Application') {
            steps {
                bat 'npm run build'
            }
        }

        stage('OWASP Dependency Check') {
            steps {
                bat '''
                C:\\dependency-check\\bin\\dependency-check.bat ^
                --project "Netflix" ^
                --scan . ^
                --format HTML ^
                --out reports
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    withCredentials([
                        string(
                            credentialsId: 'SONAR_TOKEN',
                            variable: 'SONAR_TOKEN'
                        )
                    ]) {

                        bat """
                        "%SONARQUBE_SCANNER_HOME%\\bin\\sonar-scanner.bat" ^
                        -Dsonar.projectKey=netflix ^
                        -Dsonar.projectName=Netflix ^
                        -Dsonar.sources=. ^
                        -Dsonar.host.url=http://localhost:9000 ^
                        -Dsonar.token=%SONAR_TOKEN%
                        """
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Trivy Filesystem Scan') {
            steps {
                bat '''
                trivy fs . ^
                --format json ^
                --output reports\\trivy-fs.json
                '''
            }
        }

        stage('Docker Build') {
            steps {
                bat '''
                docker build ^
                -t %IMAGE_NAME%:%IMAGE_TAG% ^
                .
                '''
            }
        }

        stage('Trivy Image Scan') {
            steps {
                bat '''
                trivy image ^
                --format json ^
                --output reports\\trivy-image.json ^
                %IMAGE_NAME%:%IMAGE_TAG%
                '''
            }
        }

        stage('Pre-Production Security Gate') {
            steps {
                bat '''
                trivy image ^
                --severity CRITICAL ^
                --exit-code 1 ^
                %IMAGE_NAME%:%IMAGE_TAG%
                '''
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Docker image is security approved'
            }
        }

        stage('Kubernetes Deployment') {
            steps {
                echo 'Kubernetes deployment will be performed here'
            }
        }

        stage('Archive Security Reports') {
            steps {
                archiveArtifacts artifacts: 'reports/**/*',
                    allowEmptyArchive: true
            }
        }
    }

    post {

        success {
            echo 'SECURITY GATE PASSED - Pipeline completed successfully'
        }

        failure {
            echo 'SECURITY GATE FAILED - Deployment blocked'
        }

        always {
            archiveArtifacts artifacts: 'reports/**/*',
                allowEmptyArchive: true
        }
    }
}
