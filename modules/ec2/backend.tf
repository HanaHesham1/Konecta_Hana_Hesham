terraform {
  backend "local" {
    path = "./shared/terraform.tfstate"
  }
}
