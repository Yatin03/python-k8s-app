# **Python Web App Kubernetes Deployment**

This repository contains the code and configurations to deploy a Python web application on Kubernetes with Horizontal Pod Autoscaling (HPA). The application is designed to display a simple web page with a static image, demonstrating the integration of Kubernetes deployment strategies.

---

## **Folder Structure**

```plaintext
.
├── Dockerfile
├── README.md
├── k8s_manifests
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── namespace.yaml
│   └── service.yaml
└── src
    ├── app.py
    ├── requirements.txt
    ├── static
    │   └── image.png
    └── templates
        └── index.html

```

---

## **Usage of Files and Folders**

1. **`Dockerfile`**: 
   - Builds a Docker image for the Python web application.
   - Ensures the application runs securely as a non-root user.

2. **`k8s_manifests/`**:
   - Contains Kubernetes resource definitions for deploying the application:
     - **`namespace.yaml`**: Creates the `python-web-app` namespace.
     - **`deployment.yaml`**: Deploys the application with replicas and resource limits.
     - **`hpa.yaml`**: Configures the Horizontal Pod Autoscaler with a target CPU utilization of 60%.
     - **`service.yaml`**: Exposes the application to external traffic via NodePort.

3. **`src/`**:
   - **`app.py`**: A Flask-based Python application that serves the web page and static content.
   - **`requirements.txt`**: Lists Python dependencies (e.g., Flask, Werkzeug).
   - **`static/`**: Stores static assets such as the image displayed on the web page.
   - **`templates/`**: Contains the HTML template for the application.

---

## **Prerequisites**

Before running or deploying the application, ensure the following are installed:

1. **Docker**: To build and run the application container.
2. **Kubernetes**: To deploy the application. Use Minikube, Docker Desktop, or any other Kubernetes setup.
3. **kubectl**: Kubernetes command-line tool to manage deployments.
4. **Metrics Server**: Required for HPA functionality in Kubernetes.

---

## **Quick Start**

1. **Build the Docker Image**:
   ```bash
   docker build -t your_dockerhub_username/python-web-app:latest .
   ```

2. **Push the Image to Docker Hub**:
   ```bash
   docker push your_dockerhub_username/python-web-app:latest
   ```

3. **Deploy on Kubernetes**:
   Apply the Kubernetes manifests in the following order:
   ```bash
   kubectl apply -f k8s_manifests/
   ```

4. **Access the Application**:
   Open your browser and navigate to:
   ```
   http://<minikube-ip>:<node-port>
   ```
