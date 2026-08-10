# 🎬 Netflix DevSecOps with AI-Powered Security

![DevSecOps](https://img.shields.io/badge/DevSecOps-CI%2FCD-blue)
![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-red)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5)
![SonarQube](https://img.shields.io/badge/SonarQube-Code%20Quality-orange)
![Trivy](https://img.shields.io/badge/Trivy-Container%20Security-purple)
![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-orange)
![Grafana](https://img.shields.io/badge/Grafana-Dashboard-yellow)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![FastAPI](https://img.shields.io/badge/FastAPI-AI%20API-009688)

> **An AI-powered DevSecOps pipeline for automated security scanning, risk prediction, container security, Kubernetes deployment, and real-time monitoring of a Netflix-style web application.**

---

## 📌 Table of Contents

* [Project Overview](#-project-overview)
* [Objectives](#-objectives)
* [Key Features](#-key-features)
* [System Architecture](#-system-architecture)
* [Technology Stack](#-technology-stack)
* [DevSecOps Pipeline](#-devsecops-pipeline)
* [AI Security Module](#-ai-security-module)
* [Security Implementation](#-security-implementation)
* [Containerization](#-containerization)
* [Kubernetes Deployment](#-kubernetes-deployment)
* [Monitoring and Observability](#-monitoring-and-observability)
* [Project Structure](#-project-structure)
* [Prerequisites](#-prerequisites)
* [Installation and Setup](#-installation-and-setup)
* [AI Module Setup](#-ai-module-setup)
* [API Usage](#-api-usage)
* [Jenkins Pipeline](#-jenkins-pipeline)
* [Running the Application](#-running-the-application)
* [Screenshots](#-screenshots)
* [Security Workflow](#-security-workflow)
* [Future Enhancements](#-future-enhancements)
* [Conclusion](#-conclusion)
* [Contributors](#-contributors)

---

# 📖 Project Overview

This project implements a **DevSecOps-based CI/CD pipeline** for a Netflix-style web application.

The main goal is to integrate **security, automation, AI-based risk prediction, containerization, Kubernetes deployment, and monitoring** into a single software delivery workflow.

Instead of treating security as a separate activity, security checks are integrated directly into the CI/CD pipeline.

The project uses:

* **GitHub** for source code management
* **Jenkins** for CI/CD automation
* **SonarQube** for static code analysis
* **OWASP Dependency-Check** for dependency vulnerability scanning
* **Trivy** for filesystem and container vulnerability scanning
* **Docker** for containerization
* **Docker Hub** for image storage
* **Kubernetes / Minikube** for deployment
* **Prometheus** for metrics collection
* **Grafana** for monitoring and visualization
* **Python + FastAPI + Machine Learning** for AI-based security risk prediction

---

# 🎯 Objectives

The major objectives of this project are:

1. Automate the software delivery process using CI/CD.
2. Integrate security checks into the development pipeline.
3. Detect source-code quality and security issues.
4. Identify vulnerable third-party dependencies.
5. Scan Docker images for known vulnerabilities.
6. Predict application security risk using Machine Learning.
7. Prevent insecure builds from reaching production.
8. Deploy the application using Kubernetes.
9. Monitor infrastructure and application metrics.
10. Provide a complete DevSecOps workflow from code commit to deployment.

---

# ✨ Key Features

### 🔹 CI/CD Automation

* Automated Jenkins pipeline
* GitHub source-code integration
* Automated build process
* Automated security validation

### 🔹 DevSecOps Security

* SonarQube SAST analysis
* OWASP Dependency-Check
* Trivy filesystem scanning
* Trivy Docker image scanning
* Pre-production security gate

### 🔹 AI Security

* Machine Learning-based risk prediction
* Security metrics-based prediction
* FastAPI REST API
* Trained ML model
* Security risk classification

### 🔹 Containerization

* Dockerized application
* Docker image scanning
* Docker Hub image repository

### 🔹 Kubernetes

* Kubernetes Deployment
* Kubernetes Service
* Minikube-based local cluster
* Container orchestration

### 🔹 Monitoring

* Prometheus metrics
* Grafana dashboards
* Node Exporter
* Kubernetes monitoring
* Application-level metrics

---

# 🏗️ System Architecture

```text
                         ┌─────────────────────┐
                         │      Developer      │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       GitHub        │
                         │   Source Repository │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       Jenkins       │
                         │     CI/CD Server     │
                         └──────────┬──────────┘
                                    │
                   ┌────────────────┼─────────────────┐
                   │                │                 │
                   ▼                ▼                 ▼
              ┌─────────┐    ┌─────────────┐   ┌──────────┐
              │SonarQube│    │    OWASP    │   │  Trivy   │
              │  SAST   │    │ Dependency  │   │ Security │
              └────┬────┘    │    Check     │   │  Scan    │
                   │         └──────┬──────┘   └────┬─────┘
                   │                │               │
                   └────────────────┼───────────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │  Security Gate      │
                         │  Pass / Fail        │
                         └──────────┬──────────┘
                                    │
                              Security Pass
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │    Docker Build     │
                         │   Container Image   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │     Trivy Image     │
                         │        Scan         │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │     Docker Hub      │
                         │   Image Registry    │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │     Kubernetes      │
                         │      Minikube       │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   Netflix Web App   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                   ┌────────────────────────────────┐
                   │         Monitoring             │
                   │                                │
                   │ Prometheus → Grafana            │
                   │ Node Exporter → Infrastructure │
                   └────────────────────────────────┘


                 AI SECURITY MODULE
                         │
                         ▼
              ┌──────────────────────┐
              │ Security Metrics     │
              │ Bugs / Vulnerability │
              │ Code Smells / etc.   │
              └──────────┬───────────┘
                         │
                         ▼
              ┌──────────────────────┐
              │ Machine Learning     │
              │ Security Risk Model  │
              └──────────┬───────────┘
                         │
                         ▼
              ┌──────────────────────┐
              │ FastAPI Prediction   │
              │      /predict        │
              └──────────────────────┘
```

---

# 🛠️ Technology Stack

| Category               | Technology                       |
| ---------------------- | -------------------------------- |
| Frontend               | React / Vite                     |
| Backend                | FastAPI                          |
| Programming            | JavaScript / TypeScript / Python |
| Source Control         | Git, GitHub                      |
| CI/CD                  | Jenkins                          |
| Code Quality           | SonarQube                        |
| SAST                   | SonarQube                        |
| Dependency Security    | OWASP Dependency-Check           |
| Security Scanner       | Trivy                            |
| Containerization       | Docker                           |
| Registry               | Docker Hub                       |
| Orchestration          | Kubernetes                       |
| Local Cluster          | Minikube                         |
| Monitoring             | Prometheus                       |
| Visualization          | Grafana                          |
| Infrastructure Metrics | Node Exporter                    |
| AI/ML                  | Python, Scikit-learn             |
| ML API                 | FastAPI                          |
| Model Persistence      | Joblib                           |

---

# 🔄 DevSecOps Pipeline

The pipeline follows the below workflow:

```text
Developer
   ↓
GitHub
   ↓
Jenkins
   ↓
Checkout Source Code
   ↓
Install Dependencies
   ↓
Build Application
   ↓
SonarQube SAST
   ↓
OWASP Dependency-Check
   ↓
AI Security Risk Prediction
   ↓
Pre-Production Security Gate
   ↓
Docker Build
   ↓
Trivy Container Scan
   ↓
Docker Hub Push
   ↓
Kubernetes Deployment
   ↓
Prometheus Monitoring
   ↓
Grafana Visualization
```

---

# 🤖 AI Security Module

The project includes an **AI-powered security risk prediction module**.

The purpose of this module is to analyze security and code-quality metrics and predict the overall security risk of the application.

## Input Features

The ML model uses security-related features such as:

```text
critical
high
medium
low
sonar_bugs
code_smells
coverage
```

## Output

The model predicts:

```text
Security Risk
```

The risk prediction can be used as an additional security signal before deployment.

---

# 🧠 Machine Learning Workflow

```text
Security Dataset
       ↓
Data Preprocessing
       ↓
Feature Selection
       ↓
Model Training
       ↓
Model Evaluation
       ↓
Model Serialization
       ↓
security_model.pkl
       ↓
FastAPI Application
       ↓
POST /predict
       ↓
Security Risk Prediction
```

---

# 🔐 Security Implementation

Security is integrated at multiple stages of the pipeline.

## 1. SonarQube

Used for:

* Static Application Security Testing
* Code quality analysis
* Bug detection
* Vulnerability detection
* Code smell detection
* Security hotspot analysis
* Quality Gate validation

---

## 2. OWASP Dependency-Check

Used to identify known vulnerabilities in third-party dependencies.

```text
Application Dependencies
          ↓
OWASP Dependency-Check
          ↓
CVE Analysis
          ↓
Vulnerability Report
```

---

## 3. Trivy

Trivy is used for security scanning of:

* Filesystem
* Docker images
* OS packages
* Application dependencies
* Known CVEs

Example:

```bash
trivy image <docker-image>
```

---

# 🚦 Pre-Production Security Gate

The security gate ensures that the application does not proceed to the next stage if critical security checks fail.

```text
             Security Checks
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
    SonarQube    OWASP      Trivy
        │          │          │
        └──────────┼──────────┘
                   ▼
            Security Gate
              /        \
            PASS        FAIL
             │            │
             ▼            ▼
       Docker Build    Pipeline Stop
             │
             ▼
        Deployment
```

This implements the **Shift-Left Security** principle.

---

# 🐳 Containerization

The application is containerized using Docker.

Docker provides:

* Consistent runtime environment
* Application isolation
* Portable deployment
* Easy scaling
* Simplified CI/CD integration

### Build Docker Image

```bash
docker build -t netflix-app:latest .
```

### Run Container

```bash
docker run -d -p 3000:3000 netflix-app:latest
```

### List Images

```bash
docker images
```

---

# ☸️ Kubernetes Deployment

Kubernetes is used for container orchestration.

The application is deployed on a local **Minikube Kubernetes cluster**.

### Kubernetes Components

```text
Kubernetes Cluster
       │
       ├── Deployment
       │      └── Netflix Application Pods
       │
       └── Service
              └── Application Access
```

### Start Minikube

```bash
minikube start
```

### Check Nodes

```bash
kubectl get nodes
```

### Deploy Application

```bash
kubectl apply -f deployment.yaml
```

### Check Deployment

```bash
kubectl get deployments
```

### Check Pods

```bash
kubectl get pods
```

### Check Services

```bash
kubectl get services
```

### Access Application

```bash
minikube service netflix-app
```

---

# 📊 Monitoring and Observability

The project uses **Prometheus and Grafana** for monitoring.

## Prometheus

Prometheus collects metrics from:

* Kubernetes
* Application
* Node Exporter
* Infrastructure

## Grafana

Grafana is used to visualize collected metrics using dashboards.

### Monitoring Architecture

```text
Kubernetes / Application / Server
             │
             ▼
        Node Exporter
             │
             ▼
         Prometheus
             │
             ▼
          Grafana
             │
             ▼
        Monitoring
        Dashboards
```

### Metrics Monitored

* CPU utilization
* Memory utilization
* Disk I/O
* System load
* Kubernetes resources
* Pod metrics
* Application metrics

---

# 📁 Project Structure

```text
Netflix-Devsecops/
│
├── .github/
│   └── workflows/
│
├── ai-security/
│   ├── dataset/
│   │   └── security_dataset.csv
│   │
│   ├── models/
│   │   └── security_model.pkl
│   │
│   ├── reports/
│   │
│   ├── utils/
│   │
│   ├── app.py
│   ├── train.py
│   ├── predict.py
│   ├── requirements.txt
│   └── README.md
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── monitoring/
│   ├── prometheus/
│   └── grafana/
│
├── public/
│
├── src/
│   ├── components/
│   ├── pages/
│   └── assets/
│
├── Dockerfile
├── Jenkinsfile
├── docker-compose.yml
├── package.json
├── package-lock.json
├── vite.config.ts
├── .env.example
└── README.md
```

> **Note:** Folder names should be updated if your actual repository structure differs.

---

# 💻 Prerequisites

Before running the project, install:

* Git
* Node.js
* npm
* Python 3.12+
* Docker
* Jenkins
* SonarQube
* OWASP Dependency-Check
* Trivy
* Minikube
* kubectl
* Prometheus
* Grafana

---

# ⚙️ Installation and Setup

## Step 1: Clone Repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd Netflix-Devsecops
```

---

## Step 2: Install Frontend Dependencies

```bash
npm install
```

---

## Step 3: Configure Environment Variables

Create a `.env` file:

```env
VITE_TMDB_API_KEY=your_api_key
```

> Never commit real API keys or secrets to GitHub.

---

## Step 4: Run Application

```bash
npm run dev
```

The application will be available on the local development server.

---

# 🤖 AI Module Setup

Go to the AI security directory:

```bash
cd ai-security
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate it on Linux:

```bash
source venv/bin/activate
```

On Windows:

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

# 🧪 Train AI Model

Run:

```bash
python train.py
```

The trained model is saved as:

```text
models/security_model.pkl
```

---

# 🚀 Start AI Security API

Run:

```bash
uvicorn app:app --host 0.0.0.0 --port 8000
```

API documentation:

```text
http://localhost:8000/docs
```

FastAPI automatically provides interactive Swagger documentation.

---

# 🔌 API Usage

## Endpoint

```text
POST /predict
```

### Example Request

```json
{
  "critical": 1,
  "high": 2,
  "medium": 4,
  "low": 5,
  "sonar_bugs": 2,
  "code_smells": 10,
  "coverage": 80
}
```

### Example Response

```json
{
  "risk": "Low"
}
```

> The exact response structure depends on the implementation of `app.py`.

---

# 🔧 Jenkins Pipeline

The Jenkins pipeline automates the complete DevSecOps workflow.

### Pipeline Stages

```text
1. Checkout
       ↓
2. Install Dependencies
       ↓
3. Build
       ↓
4. SonarQube Analysis
       ↓
5. Quality Gate
       ↓
6. OWASP Dependency-Check
       ↓
7. AI Security Analysis
       ↓
8. Docker Build
       ↓
9. Trivy Image Scan
       ↓
10. Docker Hub Push
       ↓
11. Kubernetes Deployment
```

---

# 🧱 CI/CD Security Gate

The pipeline uses a security gate before deployment.

Example Jenkins logic:

```text
SonarQube Quality Gate
        ↓
     PASS?
     /    \
   YES     NO
    ↓       ↓
 Continue   STOP
 Pipeline   Pipeline
```

This ensures that security issues are identified before the application is deployed.

---

# 🚀 Running the Complete Project

### Start Jenkins

```bash
sudo systemctl start jenkins
```

### Start Docker

```bash
sudo systemctl start docker
```

### Start Minikube

```bash
minikube start
```

### Verify Kubernetes

```bash
kubectl get nodes
```

### Deploy Application

```bash
kubectl apply -f k8s/
```

### Verify Pods

```bash
kubectl get pods
```

### Access Application

```bash
minikube service netflix-app
```

---

# 📸 Screenshots

Add project screenshots in this section.

### 🏠 Netflix Application

```text
screenshots/netflix-home.png
```

### 🔄 Jenkins Pipeline

```text
screenshots/jenkins-pipeline.png
```

### 🔍 SonarQube Analysis

```text
screenshots/sonarqube.png
```

### 🛡️ Trivy Scan

```text
screenshots/trivy-scan.png
```

### 🤖 AI Security Prediction

```text
screenshots/ai-security.png
```

### ☸️ Kubernetes Deployment

```text
screenshots/kubernetes.png
```

### 📊 Grafana Dashboard

```text
screenshots/grafana.png
```

### 📈 Prometheus

```text
screenshots/prometheus.png
```

> Recommended: create a `screenshots/` directory in your repository and place the actual images there.

---

# 🔐 Security Workflow

The complete security workflow is:

```text
Source Code
     ↓
SonarQube
     ↓
Code Quality + SAST
     ↓
OWASP Dependency-Check
     ↓
Dependency Vulnerabilities
     ↓
AI Security Risk Prediction
     ↓
Security Gate
     ↓
Docker Build
     ↓
Trivy Container Scan
     ↓
Docker Registry
     ↓
Kubernetes
```

---

# 🧠 DevSecOps Approach

This project follows the principle:

> **"Build Security into the Pipeline, Not After the Pipeline."**

Security is continuously integrated into:

* Development
* Code analysis
* Dependency management
* Containerization
* Deployment
* Monitoring

This reduces the risk of vulnerable software reaching the deployment environment.

---

# 📈 Future Enhancements

The project can be extended with:

* Automated security alerts
* Slack / Email notifications
* Advanced ML-based vulnerability prediction
* Real-time AI security monitoring
* Kubernetes Horizontal Pod Autoscaling
* GitHub Webhooks
* Helm Charts
* Terraform-based infrastructure provisioning
* Ansible automation
* Prometheus Alertmanager
* Kubernetes security policies
* Image signing using Cosign
* Supply-chain security
* Cloud deployment using AWS / Azure / GCP

---

# 🎓 Learning Outcomes

Through this project, the following concepts were implemented:

* CI/CD
* DevSecOps
* Jenkins Pipeline
* Git and GitHub
* Static Application Security Testing
* Dependency Vulnerability Scanning
* Container Security
* Docker
* Kubernetes
* Minikube
* Prometheus
* Grafana
* Machine Learning
* FastAPI
* REST API
* Security Gates
* Monitoring and Observability

---

# 🏁 Conclusion

The **Netflix DevSecOps with AI-Powered Security** project demonstrates how modern software development can combine **CI/CD automation, security scanning, Artificial Intelligence, containerization, Kubernetes, and monitoring** into a unified pipeline.

The implementation follows a **Shift-Left Security** approach where security is considered throughout the software delivery lifecycle rather than only before deployment.

The integration of an AI-based security risk prediction module provides an additional layer of intelligent security analysis, while Kubernetes and monitoring tools enable reliable deployment and observability.

Overall, this project demonstrates a practical implementation of a modern **AI-assisted DevSecOps lifecycle**.

---

# 👩‍💻 Contributors

**Project Team**

* Contributor 1
* Contributor 2
* Contributor 3
* Contributor 4

---

# ⭐ Project Highlights

```text
✔ Automated CI/CD Pipeline
✔ DevSecOps Security Integration
✔ SonarQube SAST
✔ OWASP Dependency Scanning
✔ Trivy Security Scanning
✔ AI-Based Security Risk Prediction
✔ Docker Containerization
✔ Docker Hub Registry
✔ Kubernetes Deployment
✔ Prometheus Monitoring
✔ Grafana Dashboards
✔ FastAPI AI Security API
```

---

## 📄 License

This project is developed for **educational and academic purposes** as part of the CDAC PGCP-ITISS project.

---
