# # project-root/backend-config.tf

# data "terraform_remote_state" "backend" {
#   backend = "s3"
#   config = {
#     bucket = "ada-state-bucket"
#     key    = "global/s3/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
# locals {
#   backend_config = {
#     bucket         = "ada-state-bucket"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "ada-state-lock-table"
#     encrypt        = true
#   }
# }

# resource "null_resource" "backend_config" {
#   triggers = {
#     config = jsonencode(local.backend_config)
#   }
# }

terraform {
  backend "s3" {
    bucket         = "ada-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ada-state-lock-table"
    encrypt        = true
  }
}