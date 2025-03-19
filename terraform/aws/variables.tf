variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_name" {
  type    = string
  default = "tododb"
}

variable "db_username" {
  type    = string
  default = "postgres"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_security_group_id" {
  type = string
}

variable "app_image" {
  type    = string
  default = "123456789012.dkr.ecr.us-east-1.amazonaws.com/todo-app:latest"
}
