# **Overview**

**Task Manager** application is designed to help users track daily tasks, whether it's replying to emails, taking a walk, or preparing for tomorrow. The app allows you to add, complete, or delete tasks via a sleek web interface or using its lightweight API.

This project automates the full lifecycle of task manager web application from local development to live deployment on Azure. it showcases secure and scalable deployment using **Terraform**, **GitHub Actions**, **Azure Container Apps**, and **Azure Front Door**.

The goal was to:

- Containerise a Python web app
- Push it securely to Azure Container Registry (ACR)
- Provision infrastructure as code using Terraform
- Enable end-to-end CI/CD using GitHub Actions
- Serve the app publicly via custom HTTPS domain using Azure Front Door





## **Architecture Diagram**

![alt text](<ACA project (2).png>)

## **Task Manager application demo**

<video controls src="Screen Recording 2025-06-25 190852.mp4" title="Title"></video>



### **Main Features and Services**

| Component | Description |
| --- | --- |
| **Azure Container Registry (ACR)** | Stores Docker images pushed from GitHub workflows |
| **Azure Container Apps (ACA)** | Hosts and scales the Task Manager containerised app |
| **Azure Front Door** | Public-facing endpoint, supports HTTPS, domain routing |
| **Terraform** | Automates provisioning of Azure infrastructure |
| **GitHub Actions** | CI/CD pipelines for building, scanning, and deploying |
| **Trivy** | Security scanning of Docker containers |
| **TFLint** | Validates Terraform for syntax and standards |
| **Checkov** | Infrastructure security scanner |



## **Project Structure**



## Azure Deployment Workflow

The deployment of the **task manager application** is fully automated using GitHub Actions and Terraform, across the following stages:

#### 1. Container Build & Push (`push-docker-image.yml`)

Changes to the `app/` folder or `Dockerfile` trigger this workflow. It builds the Docker image, scans it for vulnerabilities using **Trivy**, and pushes it to **Azure Container Registry (ACR)**.

#### 2. Terraform Validation (`terraform-plan.yml`)

When a pull request is created, this pipeline runs `terraform plan`, **TFLint**, and **Checkov** against files in the `terraform/` directory to catch errors and security risks before merge.

#### 3. Infrastructure Provisioning (`terraform-apply.yml`)

After merging to `main`, this job provisions all infrastructure using **Terraform**:

- **Azure Container Apps** to host the app
- **ACR** to store the image
- **Virtual network** & identity
- **Azure Front Door** for secure public access

### 🌍 Live Deployment

**Azure Container Apps** pulls the latest Docker image from ACR, and **Azure Front Door** routes HTTPS traffic to the app via your custom domain. The task manager becomes instantly live for users.


----
###  **GitHub Actions (CICD):**

**Push-docker-image.yml workflow** :repeat:

![alt text](<docker image push .png>)

**Terraform-plan.yml workflow** :repeat:

![alt text](<terraform plan.png>)

**Terraform-apply.yml workflow** :repeat:

![alt text](<terraform apply .png>)

----

### **Web App on Azure**

:arrow_forward: **Azure Container Apps Overview**

![alt text](<container apps.png>)
![alt text](<container website link.png>)



 :arrow_forward: **Azure Front Door Route & DNS Configuration**

![alt text](<frontdoor route.png>)
![alt text](<front door end point website link.png>)

----
### Website link

https://taskmanager.guled.co.uk