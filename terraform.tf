terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Terraform_code2"
    workspaces {
      name = "Terraform_code2"
    }
  }
}
