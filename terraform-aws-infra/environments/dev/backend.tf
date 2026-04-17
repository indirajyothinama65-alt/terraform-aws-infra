terraform {
  backend "s3" {
    bucket  = "terraform-iac-state-jyo"
    key     = "dev/terraform.tfstate"
    region  = "ap-south-1"
    profile = "terraform-iac"
  }
}
