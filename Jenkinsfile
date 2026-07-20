pipeline {
agent any

```
environment {
    PATH = "/opt/node/bin:/usr/local/bin:/usr/bin:/bin"
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
            sh '/opt/node/bin/node -v'
            sh 'PATH=/opt/node/bin:$PATH /opt/node/bin/npm -v'
        }
    }

    stage('Install Dependencies') {
        steps {
            sh 'PATH=/opt/node/bin:$PATH /opt/node/bin/npm install'
        }
    }

    stage('Build Application') {
        steps {
            sh 'PATH=/opt/node/bin:$PATH /opt/node/bin/npm run build'
        }
    }

    stage('OWASP Dependency Check') {
        steps {
            sh '''
                mkdir -p reports

                dependency-check.sh \
                --project "Netflix" \
                --scan . \
                --format HTML \
                --out reports \
                --disableAssembly \
                --disableOssIndex
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
                    sh '''
                        $SONARQUBE_SCANNER_HOME/bin/sonar-scanner \
                        -Dsonar.projectKey=netflix \
                        -Dsonar.projectName=Netflix \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=$SONAR_HOST_URL \
                        -Dsonar.token=$SONAR_TOKEN
                    '''
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
            sh '''
                mkdir -p reports

                trivy fs . \
                --format json \
                --output reports/trivy-fs.json
            '''
        }
    }

    stage('Docker Build') {
        steps {
            sh '''
                docker build \
                -t ${IMAGE_NAME}:${IMAGE_TAG} \
                .
            '''
        }
    }

    stage('Trivy Image Scan') {
        steps {
            sh '''
                trivy image \
                --format json \
                --output reports/trivy-image.json \
                ${IMAGE_NAME}:${IMAGE_TAG}
            '''
        }
    }

    stage('Pre-Production Security Gate') {
        steps {
            sh '''
                trivy image \
                --severity CRITICAL \
                --exit-code 1 \
                ${IMAGE_NAME}:${IMAGE_TAG}
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
```

}

