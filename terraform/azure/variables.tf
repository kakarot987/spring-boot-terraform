variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "East US"
}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "app_image" {
  type    = string
  default = "todoapp.azurecr.io/todo-app:latest"
}
