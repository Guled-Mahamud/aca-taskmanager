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

<!-- Architecture diagram -->
![Architecture Diagram](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/aca-project.png?raw=true)

## **🎥Task Manager Demo**


![App Demo](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/tmdemo.gif?raw=true)




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

<!-- CI/CD pipeline screenshots -->

 **Push Docker Image**  :repeat:

  ![Push Docker Image](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/docker-image-push.png?raw=true)



**Terraform Plan**  :repeat:

  ![Terraform Plan](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/terraform-plan.png?raw=true)


 **Terraform Apply**  :repeat:

  ![Terraform Apply](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/terraform-apply.png?raw=true)

 

----

### **Web App on Azure**

:arrow_forward: **Azure Container Apps Overview**

<!-- App screenshots -->
![Task Manager UI](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/container-apps.png?raw=true)

![Web App Link](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/container-website-link.png?raw=true)



 :arrow_forward: **Azure Front Door Route & DNS Configuration**

<!-- Front Door setup -->

 **Route Configuration:**  
  ![Front Door Route](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/frontdoor-route.png?raw=true)

 **Endpoint Overview:**  
  ![Front Door Endpoint](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/frontdoor-endpoint.png?raw=true)



----
### Website link

https://taskmanager.guled.co.uk

 ![app website](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/container-overview.png?raw=true)