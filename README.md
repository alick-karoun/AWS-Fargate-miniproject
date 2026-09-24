# ☕ Coffee Shop Website — AWS Fargate Deployment

A simple front-end coffee shop website, containerized with Docker and deployed on **AWS ECS Fargate** across multiple Availability Zones for high availability.

> **Note:** This is a learning/mini project. AWS resources were torn down after testing to avoid ongoing costs, so no live demo link is provided.

---

## 📐 Architecture

![Architecture Diagram](architecture-diagram.png)

## 🛠️ Prerequisites

* **AWS Account** with administrative permissions.
* **AWS CLI** installed and configured (`aws configure`).
* **Docker Engine** / Docker Desktop running locally.
---

## 📌 Notes

- This project was built primarily to practice deploying containerized apps on **ECS Fargate** with a proper Multi-AZ VPC setup.
- Documentation (this README + architecture diagram) is the primary deliverable, since the live environment is no longer running.

---

## 🚀 Step-by-Step Guide

### Step 1: Provision Network Infrastructure
1. Create a custom **Amazon VPC**.
2. Create **2 Public Subnets** (across different AZs) and **2 Private Subnets**.
3. Attach an **Internet Gateway (IGW)** to the VPC and configure route tables for public routing.
   #### structure of the vpc:
   <img width="1331" height="443" alt="image" src="https://github.com/user-attachments/assets/01d23256-033e-4548-9632-7f0dc48e0a7d" />




---

### Step 2: Configure Security Groups
1. **ALB Security Group:**
   * **Inbound:** HTTP (Port `80`).
2. **app-sg:**
   * **Inbound:** HTTP (Port `80`).
3. **data-sg:**
   * **Inbound:** MySQL/Aurora (Port `3306`), source-> app-sg

---

### Step 3: Containerize Application & Push to ECR
1. Make ECR repository:
2. Build DOcker image: 

### Authenticate Docker with Amazon ECR registry:
 ```bash
   aws ecr get-login-password --region <YOUR_REGION> | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.<YOUR_REGION>.amazonaws.com
```
### Tagging and pushing the image
```bash
   docker tag my-app:latest <ACCOUNT_ID>.dkr.ecr.<YOUR_REGION>[.amazonaws.com/my-app:latest](https://.amazonaws.com/my-app:latest)
   docker push <ACCOUNT_ID>.dkr.ecr.<YOUR_REGION>[.amazonaws.com/my-app:latest](https://.amazonaws.com/my-app:latest)
```


