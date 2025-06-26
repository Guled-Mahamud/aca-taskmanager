# **Overview**

**Task Manager** application is designed to help users track daily tasks, whether it's replying to emails, taking a walk, or preparing for tomorrow. The app allows you to add, complete, or delete tasks via a sleek web interface.

This project automates the full lifecycle of task manager application from local development to live deployment on Azure. it showcases secure and scalable deployment using **Terraform**, **GitHub Actions**, **Azure Container Apps**, **Azure Front Door**, and **Cloudflare** for DNS management.

The goal was to:

- Containerise **Task Manager app**
- Push it securely to **Azure Container Registry (ACR)**
- Provision infrastructure as code using **Terraform**
- Enable end-to-end CI/CD using **GitHub Actions**
- Serve the app publicly via custom **HTTPS domain** using **Azure Front Door**, with DNS resolution managed by **Cloudflare**





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
```
├── .github
│ └── workflows
│ ├── push-docker-image.yml     # CI: Build and push Docker image to ACR
│ ├── terraform-plan.yml        # CI: Terraform plan to preview changes
│ ├── terraform-apply.yml       # CD: Terraform apply to deploy infra
│ └── terraform-destroy.yml     # CD: Terraform destroy to tear down infra
│
├── app2                        # task manager app
│ ├── static
│ │ ├── script.js
│ │ └── style.css
│ ├── templates
│ │ └── index.html
│ ├── app.py
│ └── requirements.txt
│
├── docs
│
├── terraform
│ ├── modules                   # Terraform modules for reusable infra
│ │ ├── container_app
│ │ ├── container_registry
│ │ ├── frontdoor
│ │ ├── network
│ │ └── role_assignment
│ ├── backend.tf               # Remote backend config 
│ ├── main.tf
│ ├── outputs.tf
│ ├── providers.tf
│ └── variables.tf
│
├── .dockerignore
├── .gitignore
├── Dockerfile
└── README.md
```


## Azure Deployment Workflow

The deployment of the **task manager application** is fully automated using GitHub Actions and Terraform, across the following stages:

#### 1. **Dockerisation**  
   The task manager app (`app2/`) is containerised using the Dockerfile (located in the project root based on the structure). This ensures a consistent environment for deployment.

#### 2. Container Build & Push (`push-docker-image.yml`)

Changes to the `app2/` folder or `Dockerfile` trigger this workflow. It builds the Docker image, scans it for vulnerabilities using **Trivy**, and pushes it to **Azure Container Registry (ACR)**.

#### 3. Terraform Validation (`terraform-plan.yml`)

When a pull request is created, this pipeline runs `terraform plan`, **TFLint**, and **Checkov** against files in the `terraform/` directory to catch errors and security risks before merge.

#### 4. Infrastructure Provisioning (`terraform-apply.yml`)

After merging to `main`, this job provisions all infrastructure using **Terraform**:

- **Azure Container Apps** to host the app
- **ACR** to store the image
- **Virtual network** & identity
- **Azure Front Door** for secure public access



#### 5.🌍 Live Deployment

**Azure Container Apps** pulls the latest Docker image from ACR, and **Azure Front Door** routes HTTPS traffic to the app via the custom domain. The task manager becomes instantly live for users.

#### 6. Infrastructure destroy (`terraform-destroy.yml`)  
   This manually triggered workflow safely destroys all provisioned Azure infrastructure using `terraform destroy`.

----

## 🔐 GitHub Secrets

This project uses **GitHub Secrets** to securely manage sensitive values used during CI/CD workflows. Secrets include Azure credentials, Terraform backend configuration and environment specific variables.

They are referenced within the GitHub workflows (`push-docker-image.yml`, `terraform-plan.yml`, `terraform-apply.yml`) to:

- Authenticate to Azure using a service principal
- Configure remote Terraform state
- Securely deploy resources and container images
- Provide runtime variables to Terraform without exposing them in code
----
##  **GitHub Actions (CICD):**

<!-- CI/CD pipeline screenshots -->

 **Push Docker Image**  :repeat:

  ![Push Docker Image](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/docker-image-push.png?raw=true)



**Terraform Plan**  :repeat:

  ![Terraform Plan](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/terraform-plan.png?raw=true)


 **Terraform Apply**  :repeat:

  ![Terraform Apply](https://github.com/Guled-Mahamud/aca-taskmanager/blob/main/docs/assets/terraform-apply.png?raw=true)

 

---

## :large_blue_circle:**Azure container app & Front Door:**

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
----
### :page_facing_up: Licence

Licensed under the MIT Licence.
-----