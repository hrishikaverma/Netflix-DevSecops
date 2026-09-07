<div align="center">

  <a href="http://netflix-clone-with-tmdb-using-react-mui.vercel.app/">
    <img src="./public/assets/netflix-logo.png" alt="Netflix Logo" width="100" height="32">
  </a>

  <h1>Netflix Clone - DevSecOps</h1>

  <p>
    A Netflix-inspired web application integrated with a secure DevSecOps CI/CD pipeline.
    <br />
    Automated security scanning, containerization, Kubernetes deployment and monitoring.
  </p>

  <p>
    <a href="https://netflix-clone-react-typescript.vercel.app/">View Demo</a>
    &nbsp;·&nbsp;
    <a href="https://github.com/crazy-man22/netflix-clone-react-typescript/issues">Report Bug</a>
    &nbsp;·&nbsp;
    <a href="https://github.com/crazy-man22/netflix-clone-react-typescript/issues">Request Feature</a>
  </p>

</div>

---

# 📋 Table of Contents

* [About the Project](#-about-the-project)
* [Application Screenshots](#-application-screenshots)
* [DevSecOps Architecture](#-devsecops-architecture)
* [CI/CD Pipeline](#-cicd-pipeline)
* [Security Gate](#-security-gate)
* [Monitoring & Observability](#-monitoring--observability)
* [Technology Stack](#-technology-stack)
* [Project Features](#-project-features)
* [Prerequisites](#-prerequisites)
* [TMDB API Setup](#-tmdb-api-setup)
* [Docker](#-docker)
* [Kubernetes Deployment](#-kubernetes-deployment)
* [Monitoring Stack](#-monitoring-stack)
* [AI Security Module](#-ai-security-module)
* [Complete DevSecOps Workflow](#-complete-devsecops-workflow)
* [Project Objectives](#-project-objectives)
* [Todo](#-todo)
* [Project Summary](#-project-summary)

---

# 📌 About the Project

This project is a Netflix-inspired web application enhanced with a complete **DevSecOps CI/CD pipeline**.

The primary objective is to automate the complete application lifecycle while integrating:

* Continuous Integration and Continuous Delivery
* Static Application Security Testing
* Dependency vulnerability scanning
* Container security scanning
* Security quality gates
* Docker containerization
* Kubernetes deployment
* Infrastructure monitoring
* AI/ML-based security risk prediction

### High-Level Workflow

```text
Developer
    ↓
GitHub
    ↓
Jenkins
    ↓
Security Scanning
    ↓
Security Gate
    ↓
Docker
    ↓
Docker Hub
    ↓
Kubernetes
    ↓
Prometheus
    ↓
Grafana
```

---

# 🖥️ Application Screenshots

<div align="center">

<img src="./public/assets/home-page.png"
  alt="Netflix Clone Home Page"
  width="100%">

<p><b>Home Page</b></p>

<br />

<img src="./public/assets/mini-portal.png"
  alt="Mini Portal"
  width="100%">

<p><b>Mini Portal</b></p>

<br />

<img src="./public/assets/detail-modal.png"
  alt="Detail Modal"
  width="100%">

<p><b>Detail Modal</b></p>

<br />

<img src="./public/assets/grid-genre.png"
  alt="Grid Genre Page"
  width="100%">

<p><b>Grid Genre Page</b></p>

<br />

<img src="./public/assets/watch.png"
  alt="Watch Page"
  width="100%">

<p><b>Watch Page</b></p>

</div>

---

# 🏗️ DevSecOps Architecture

The project follows a complete **Secure Software Development Lifecycle** where security is integrated into the CI/CD pipeline instead of being performed only after deployment.

```text
                         ┌──────────────────┐
                         │    Developer     │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │      GitHub      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │     Jenkins      │
                         └────────┬─────────┘
                                  │
                 ┌────────────────┼────────────────┐
                 │                │                │
                 ▼                ▼                ▼
            SonarQube          OWASP            Trivy
                 │          Dependency Check       │
                 │                │                │
                 └────────────────┼────────────────┘
                                  ▼
                         ┌──────────────────┐
                         │  Security Gate   │
                         └────────┬─────────┘
                                  │
                             ┌────┴────┐
                             │         │
                           PASS       FAIL
                             │         │
                             ▼         ▼
                      Docker Build   Pipeline
                             │        Stops
                             ▼
                       Docker Hub
                             │
                             ▼
                       Kubernetes
                             │
                             ▼
                       Application
                             │
                    ┌────────┴────────┐
                    ▼                 ▼
               Prometheus          Grafana
```

---

# 🚀 CI/CD Pipeline

The Jenkins pipeline automates the application lifecycle from source-code commit to Kubernetes deployment.

<div align="center">

<img src="./assets/netflix_devsecops_pipeline_running.gif"
  alt="Netflix DevSecOps CI/CD Pipeline"
  width="100%">

</div>

## 🔄 Pipeline Stages

| Stage | Tool                   | Purpose                                         |
| ----- | ---------------------- | ----------------------------------------------- |
| 1     | GitHub                 | Source code management                          |
| 2     | Jenkins                | CI/CD automation                                |
| 3     | npm                    | Dependency installation and application build   |
| 4     | SonarQube              | Static code analysis                            |
| 5     | OWASP Dependency-Check | Dependency vulnerability scanning               |
| 6     | Trivy                  | Filesystem and container vulnerability scanning |
| 7     | Security Gate          | Validate security requirements                  |
| 8     | Docker                 | Build container image                           |
| 9     | Docker Hub             | Store and distribute image                      |
| 10    | Kubernetes             | Deploy application                              |
| 11    | Prometheus             | Collect metrics                                 |
| 12    | Grafana                | Visualize metrics                               |

---

# 🔐 Security Gate

Security checks are integrated directly into the CI/CD pipeline.

The deployment is allowed only when the required security and quality conditions are satisfied.

## Security Tools

| Tool                       | Purpose                                                                        |
| -------------------------- | ------------------------------------------------------------------------------ |
| **SonarQube**              | Static code analysis, bugs, vulnerabilities, code smells and security hotspots |
| **OWASP Dependency-Check** | Detect known vulnerabilities in project dependencies                           |
| **Trivy**                  | Scan filesystem and container images for vulnerabilities                       |
| **Jenkins**                | Automate security validation and pipeline control                              |

## Security Workflow

```text
Source Code
     │
     ▼
 SonarQube
     │
     ├── Bugs
     ├── Vulnerabilities
     ├── Code Smells
     └── Security Hotspots
     │
     ▼
OWASP Dependency-Check
     │
     └── Dependency Vulnerabilities
     │
     ▼
    Trivy
     │
     └── Container Vulnerabilities
     │
     ▼
┌─────────────────────────┐
│    SECURITY QUALITY     │
│         GATE            │
└───────────┬─────────────┘
            │
       ┌────┴────┐
       │         │
      PASS      FAIL
       │         │
       ▼         ▼
 Docker Build  Pipeline Stops
       │
       ▼
 Docker Hub
       │
       ▼
 Kubernetes
```

### Security Principle

```text
Detect → Validate → Block → Deploy
```

If a critical security or quality condition fails, Jenkins prevents the application from moving to the deployment stage.

---

# 📊 Monitoring & Observability

After deployment, the application and infrastructure are monitored using:

* Prometheus
* Grafana
* Node Exporter
* Kubernetes metrics

## Monitoring Architecture

```text
              Kubernetes Cluster
                      │
          ┌───────────┴───────────┐
          │                       │
          ▼                       ▼
 Application Metrics        Node Exporter
          │                       │
          └───────────┬───────────┘
                      ▼
                 Prometheus
                      │
                      ▼
                   Grafana
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
        CPU        Memory       Nodes
```

---

# 🛠️ Technology Stack

| Category            | Technologies                          |
| ------------------- | ------------------------------------- |
| Frontend            | React, TypeScript, Material UI        |
| State Management    | Redux Toolkit, RTK Query              |
| Source Control      | Git, GitHub                           |
| CI/CD               | Jenkins                               |
| Code Quality        | SonarQube                             |
| Dependency Security | OWASP Dependency-Check                |
| Container Security  | Trivy                                 |
| Containerization    | Docker                                |
| Container Registry  | Docker Hub                            |
| Orchestration       | Kubernetes, Minikube                  |
| Monitoring          | Prometheus, Grafana                   |
| System Metrics      | Node Exporter                         |
| AI Security         | Python, FastAPI, Scikit-learn, MLflow |

---

# ✨ Project Features

## React Features

* Custom Hooks
* React Context API
* Context Provider
* Lazy Loading
* React Suspense
* Code Splitting
* React Router
* Route Loaders
* Redux Toolkit
* RTK Query
* React Portals
* Forwarding Refs
* Higher Order Components
* Material UI customization
* Infinite Scrolling
* Intersection Observer API
* Slick Carousel
* Framer Motion

## DevSecOps Features

* GitHub source control
* Jenkins CI/CD
* Automated application build
* SonarQube code analysis
* OWASP Dependency-Check
* Trivy vulnerability scanning
* Pre-Production Security Gate
* Docker containerization
* Docker Hub image publishing
* Kubernetes deployment
* Minikube
* Prometheus monitoring
* Grafana dashboards
* Node Exporter
* AI/ML security risk prediction

---

# ⚙️ Prerequisites

Install the following tools before running the complete project:

* Node.js
* npm
* Git
* Docker
* Docker Compose
* Jenkins
* SonarQube
* OWASP Dependency-Check
* Trivy
* Kubernetes
* Minikube
* kubectl
* Prometheus
* Grafana

---

# 🎬 TMDB API Setup

This project uses the **TMDB API** to retrieve movie and TV-show information.

## Steps

1. Create an account on TMDB.
2. Generate a TMDB API key.
3. Create a `.env` file.
4. Copy the required variables from `.env.example`.
5. Add your TMDB API key.

Example:

```env
TMDB_V3_API_KEY=your_api_key_here
```

> ⚠️ **Important:** Never commit `.env` files or API credentials to GitHub.

---

# 📚 Third-Party Libraries

Major third-party libraries used in the application:

* [React Router DOM](https://reactrouter.com/)
* [Material UI](https://mui.com/)
* [Framer Motion](https://motion.dev/)
* [Video.js](https://videojs.com/)
* [React Slick](https://react-slick.neostack.com/)
* [Redux Toolkit](https://redux-toolkit.js.org/)
* [RTK Query](https://redux-toolkit.js.org/rtk-query/overview)

---

# 🐳 Docker

The application can be containerized and executed using Docker.

## Build Docker Image

```bash
docker build \
  --build-arg TMDB_V3_API_KEY=your_api_key_here \
  -t netflix-clone .
```

## Run Docker Container

```bash
docker run \
  --name netflix-clone-website \
  --rm \
  -d \
  -p 80:80 \
  netflix-clone
```

The application will be available at:

```text
http://localhost
```

---

# ☸️ Kubernetes Deployment

The application can be deployed using Kubernetes and Minikube.

## Start Minikube

```bash
minikube start
```

## Check Kubernetes Node

```bash
kubectl get nodes
```

## Deploy Application

```bash
kubectl apply -f k8s/
```

## Check Pods

```bash
kubectl get pods
```

## Check Services

```bash
kubectl get svc
```

## Check Deployments

```bash
kubectl get deployments
```

## Access Application

```bash
minikube service <service-name>
```

---

# 📈 Monitoring Stack

The monitoring stack consists of **Prometheus, Grafana and Node Exporter**.

## Architecture

```text
              Kubernetes
                   │
                   ▼
             Node Exporter
                   │
                   ▼
              Prometheus
                   │
                   ▼
                Grafana
```

## Prometheus

Prometheus collects infrastructure and Kubernetes metrics such as:

* CPU utilization
* Memory utilization
* Node health
* Kubernetes metrics
* Application metrics

## Grafana

Grafana provides dashboards for monitoring and visualizing:

* CPU usage
* Memory usage
* Node metrics
* Kubernetes metrics
* Application metrics

---

# 🤖 AI Security Module

The project includes an AI/ML-based security risk prediction module.

## Architecture

```text
Security Dataset
       │
       ▼
   ML Training
       │
       ▼
Security Risk Model
       │
       ▼
FastAPI Prediction API
       │
       ▼
Security Risk Prediction
```

## Technologies

* Python
* FastAPI
* NumPy
* Pandas
* Scikit-learn
* Joblib
* MLflow

## Security Metrics

The model uses security-related metrics such as:

* Critical vulnerabilities
* High vulnerabilities
* Medium vulnerabilities
* Low vulnerabilities
* SonarQube bugs
* Code smells
* Code coverage

These metrics are used to estimate the application's overall security risk.

---

# 🔄 Complete DevSecOps Workflow

```text
                    ┌──────────────┐
                    │  Developer   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    GitHub    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    Jenkins   │
                    └──────┬───────┘
                           │
             ┌─────────────┼─────────────┐
             │             │             │
             ▼             ▼             ▼
        SonarQube       OWASP         Trivy
             │       Dependency       │
             │         Check           │
             └─────────────┼───────────┘
                           ▼
                 ┌──────────────────┐
                 │  Security Gate   │
                 └────────┬─────────┘
                          │
                    ┌─────┴─────┐
                    │           │
                   PASS        FAIL
                    │           │
                    ▼           ▼
             Docker Build   Stop Pipeline
                    │
                    ▼
                Docker Hub
                    │
                    ▼
                Kubernetes
                    │
                    ▼
                Application
                    │
              ┌─────┴─────┐
              ▼           ▼
         Prometheus     Grafana
```

---

# 🎯 Project Objectives

The main objectives are:

* Automate the complete CI/CD lifecycle.
* Integrate security into software delivery.
* Detect vulnerabilities before deployment.
* Enforce security quality gates.
* Build Docker images automatically.
* Publish container images to Docker Hub.
* Deploy the application using Kubernetes.
* Monitor infrastructure and application metrics.
* Visualize system performance using Grafana.
* Use AI/ML to estimate security risk.

---

# 📝 Todo

## Application

* Improve Netflix-style animations.
* Improve application performance.
* Add accessibility improvements.
* Add more automated tests.

## DevSecOps

* Add advanced Grafana alerts.
* Improve security scanning rules.
* Add centralized logging.
* Improve Kubernetes deployment configuration.
* Add automated incident notifications.
* Improve AI-based security risk prediction.

---

# 📌 Project Summary

This project demonstrates the integration of:

**React + DevOps + DevSecOps + Docker + Kubernetes + Security + Monitoring + AI/ML**

into a single application lifecycle.

### 🚀 Build → Secure → Deploy → Monitor

```text
       BUILD
         │
         ▼
       SECURE
         │
         ▼
       DEPLOY
         │
         ▼
       MONITOR
```

**DevSecOps in Action 🚀**
