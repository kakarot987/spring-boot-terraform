# 🌍 Spring Boot + PostgreSQL Deployment (Local, AWS, GCP, Azure)

This project contains a cross-cloud deployment setup for a **Spring Boot REST API** backed by **PostgreSQL**, with full infrastructure defined using **Terraform**.

---

## 🧱 Tech Stack

- 🌱 Spring Boot (Reactive / WebFlux)
- 🐘 PostgreSQL
- 🐳 Docker
- ☁️ Terraform
- 🧪 Gradle
- 🕸️ Kubernetes (EKS / GKE / AKS)
- 📡 GitHub Actions (CI/CD) — coming soon

---

## 📁 Project Structure

```
spring-boot-terraform/           # Spring Boot project (Gradle)
terraform/
  local/                         # Local Docker Compose setup
  aws/                           # AWS: RDS + EKS + app deploy
  gcp/                           # GCP: Cloud SQL + GKE
  azure/                         # Azure: Flexible Server + AKS
README.md
```

---

## 🧪 Local Development

### 🔧 Setup

```bash
cd terraform/local
docker compose up -d
```

- PostgreSQL runs on `localhost:5432`
- App listens on `localhost:8080`

> Uses Spring profile: `local`

---

## ☁️ Cloud Deployments

Each cloud environment provisions:

- Managed PostgreSQL (RDS, Cloud SQL, Flexible Server)
- Managed Kubernetes cluster (EKS, GKE, AKS)
- Spring Boot app running in Kubernetes
- LoadBalancer service (public API endpoint)

---

## 🔨 Terraform Setup (All Clouds)

### ✅ Prerequisites

- Terraform `>= 1.3.0`
- `kubectl`, `docker`, and cloud CLIs
- Cloud provider credentials configured

---

## 🌩️ AWS Deployment

```bash
cd terraform/aws
terraform init
terraform apply
```

Required `terraform.tfvars`:

```hcl
region              = "us-east-1"
vpc_id              = "vpc-abc123"
private_subnet_ids  = ["subnet-abc", "subnet-def"]
db_security_group_id = "sg-xyz789"
db_password         = "your-password"
app_image           = "your-ecr-repo/todo-app:latest"
```

Access via:

```bash
terraform output springboot_app_url
```

---

## ☁️ GCP Deployment

```bash
cd terraform/gcp
terraform init
terraform apply
```

Resources:

- `google_sql_database_instance` (PostgreSQL)
- GKE cluster
- Kubernetes deployment + LoadBalancer

Access via:

```bash
terraform output springboot_app_url
```

---

## 🟪 Azure Deployment

```bash
cd terraform/azure
terraform init
terraform apply
```

Resources:

- `azurerm_postgresql_flexible_server`
- AKS cluster
- Kubernetes deployment + LoadBalancer

Access via:

```bash
terraform output springboot_app_url
```

---

## 🚀 Deploy Script (Optional)

You can use the `deploy.sh` helper script:

```bash
./deploy.sh aws|gcp|azure
```

---

## 🌐 Spring Profiles

| Profile | Description           | DB Location       | App Host         |
|---------|------------------------|-------------------|------------------|
| `local` | Dev via Docker Compose | localhost         | localhost        |
| `aws`   | AWS Infra              | RDS PostgreSQL    | EKS              |
| `gcp`   | GCP Infra              | Cloud SQL         | GKE              |
| `azure` | Azure Infra            | Flexible Server   | AKS              |

---

## 📦 REST API Example

Base URL: `/api/todos`

```bash
# Get all todos
GET /api/todos

# Create a new todo
POST /api/todos
Content-Type: application/json
{
  "title": "Buy milk"
}
```

---

## 📄 License

MIT. Free to use, modify, and deploy.

---

## 🙌 Credits

Built with 💙 using Spring Boot, Terraform, and cross-cloud DevOps best practices.
