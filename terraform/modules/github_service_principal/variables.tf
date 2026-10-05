variable "application_id" {
  description = "Azure client/application ID of the GitHub Actions managed identity."
  type        = string
}

variable "display_name" {
  description = "Display name of the Databricks service principal."
  type        = string
}

variable "group_id" {
  description = "Databricks group ID used for Terraform CI/CD permissions."
  type        = string
}