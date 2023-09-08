# Coworking Space Microservice
This README provides a developers addressed overview and instructions of the deployment and release process for the Coworking Space Microservice. The Coworking Space API provides business analysts with basic analytics data on user activity in the coworking space service. The deployment process is designed to be efficient and scalable, leveraging various cloud technologies and tools.

## Prerequisites
Before deploying the Coworking Space Microservice, ensure that you have the following **tools and resources set up**:
- **Development Tools:** Python 3.6+, Docker CLI, kubectl, Helm, GitHub access.
- **AWS Resources:** AWS CLI, AWS CodeBuild, AWS ECR (Elastic Container Registry), Kubernetes Environment with AWS EKS (Elastic Kubernetes Service), AWS CloudWatch.

## Deployment
1. **Database Setup**: set up the PostgreSQL database on Kubernetes cluster and populate it with data by running the following commands:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install sql-service bitnami/postgresql --set primary.persistence.enabled=false
export POSTGRES_PASSWORD=$(kubectl get secret --namespace default sql-service-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)
sh run_sql.sh
```
