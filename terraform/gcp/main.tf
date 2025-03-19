# GCP Terraform setup - Placeholder
provider "google" {
  project = var.project
  region  = var.region
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = "todo-postgres"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}
