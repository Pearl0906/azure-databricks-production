output "id" {
  description = "Databricks service principal ID."
  value       = databricks_service_principal.this.id
}

output "application_id" {
  description = "Azure application/client ID."
  value       = databricks_service_principal.this.application_id
}

output "display_name" {
  description = "Databricks service principal display name."
  value       = databricks_service_principal.this.display_name
}