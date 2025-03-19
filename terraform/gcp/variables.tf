variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "app_image" {
  type    = string
  default = "gcr.io/my-project/todo-app:latest"
}
