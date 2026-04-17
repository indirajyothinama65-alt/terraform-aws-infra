# Terraform IaC — VPC + EKS + RDS on AWS

Production-style AWS infrastructure provisioned 100% via modular Terraform. No manual console clicks.

## Architecture
- VPC (10.0.0.0/16) with public and private subnets across 2 AZs
- EKS Cluster (v1.30) with 2x t3.small worker nodes in private subnets
- RDS PostgreSQL (v16.6) in private subnets
- NAT Gateway for outbound internet from private subnets
- Remote state stored in S3

## Modules
- vpc — VPC, Subnets, IGW, NAT Gateway, Route Tables
- eks — EKS Cluster, Node Group, IAM Roles
- rds — PostgreSQL, DB Subnet Group, Security Group

## Verified Output
- 2 EKS nodes: Ready on v1.30
- RDS endpoint active on port 5432
- VPC ID: vpc-0aecf86aa90914826

## Tech Stack
Terraform | AWS EKS | AWS RDS | AWS VPC | IAM | S3 | Kubernetes

