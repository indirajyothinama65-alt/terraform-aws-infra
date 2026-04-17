terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "terraform-iac"
}

module "vpc" {
  source          = "../../modules/vpc"
  project_name    = var.project_name
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["ap-south-1a", "ap-south-1b"]
}

module "eks" {
  source             = "../../modules/eks"
  project_name       = var.project_name
  private_subnets    = module.vpc.private_subnets
  node_instance_type = "t3.small"
}

module "rds" {
  source          = "../../modules/rds"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  vpc_cidr        = "10.0.0.0/16"
  private_subnets = module.vpc.private_subnets
  db_name         = "appdb"
  db_username     = "dbadmin"
  db_password     = var.db_password
}
