resource "databricks_service_principal" "this" {
  application_id = var.application_id
  display_name   = var.display_name
}

resource "databricks_entitlements" "this" {
  service_principal_id = databricks_service_principal.this.id

  workspace_access = true
}