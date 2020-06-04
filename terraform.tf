terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "surya_accenture2"
    workspaces {
      name = "Terraform_code2"
    }
  }
}
