pipeline {

agent any

environment {

    PATH = "/opt/node/bin:/usr/local/bin:/usr/bin:/bin"

    SONARQUBE_SCANNER_HOME = tool 'sonar-scanner'

    IMAGE_NAME = 'ai-security-risk'
    IMAGE_TAG = 'v18'

    AI_SECURITY_IMAGE = 'hrishika1/ai-security-risk:latest'
    AI_SECURITY_CONTAINER = 'ai-security-api'

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

            /mnt/c/dependency-check/dependency-check/bin/dependency-check.sh \
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

            timeout(time:10, unit:'MINUTES') {

                waitForQualityGate abortPipeline:true

            }

        }

    }




    stage('Trivy Filesystem Scan') {

        steps {

            sh '''

            mkdir -p reports

            trivy fs . \
            --scanners vuln \
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

            mkdir -p reports

            trivy image \
            --scanners vuln \
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
            --scanners vuln \
            --severity HIGH,CRITICAL \
            --exit-code 1 \
            ${IMAGE_NAME}:${IMAGE_TAG}

            '''

        }

    }





    // NEW AI SECURITY STAGE

    stage('AI Security Risk Predictor Deployment') {

        steps {

            sh '''

            echo "Starting AI Security Risk Predictor"


            docker pull ${AI_SECURITY_IMAGE}


            docker rm -f ${AI_SECURITY_CONTAINER} || true



            docker run -d \
            --name ${AI_SECURITY_CONTAINER} \
            -p 8000:8000 \
            ${AI_SECURITY_IMAGE}



            sleep 10



            curl -f http://localhost:8000



            echo "AI Security API Health Check Passed"


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

            archiveArtifacts artifacts:'reports/**/*',
            allowEmptyArchive:true

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


sh '''

docker rm -f ai-security-api || true

'''


archiveArtifacts artifacts:'reports/**/*',
allowEmptyArchive:true


}


}


}
