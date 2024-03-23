terraform {
  backend "gcs" {
    bucket = "terraform-bucket"
    prefix = "tfstate"
  }
}