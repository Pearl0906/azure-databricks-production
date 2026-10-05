resource_group_name = "rg-azure-databricks"

location = "South Africa North"

tags = {
  environment = "dev"
  project     = "azure-databricks-production"
  managed_by  = "terraform"
}

storage_account_name    = "stazuredatabricksdev"
storage_filesystem_name = "datalake"

access_connector_name = "ac-azure-databricks-dev"

databricks_workspace_name              = "dbw-azure-databricks-dev"
databricks_managed_resource_group_name = "rg-databricks-managed-dev"
databricks_sku                         = "premium"

catalogue_name          = "azure_databricks_production"
catalogue_comment       = "Development Unity Catalog for the Azure Databricks platform"
catalogue_force_destroy = false

external_location_name    = "extloc-azure-databricks-production"
external_location_comment = "External location for the development ADLS Gen2 storage"

storage_credential_name    = "cred-azure-databricks"
storage_credential_comment = "Azure managed identity credential for the development ADLS Gen2 storage"

sql_warehouse_name = "sqlwh-azure-databricks-dev"

sql_warehouse_cluster_size     = "2X-Small"
sql_warehouse_min_num_clusters = 1
sql_warehouse_max_num_clusters = 1

sql_warehouse_auto_stop_mins = 10

sql_warehouse_enable_photon             = true
sql_warehouse_enable_serverless_compute = true

sql_warehouse_type         = "PRO"
sql_warehouse_channel_name = "CHANNEL_NAME_CURRENT"

sql_warehouse_no_wait = false


# ============================================================
# Databricks Job
# ============================================================

databricks_job_name        = "job-azure-databricks-production"
databricks_job_description = "Production-style Bronze, Silver and Gold data engineering pipeline."

databricks_job_max_concurrent_runs = 1

databricks_job_timeout_seconds           = 3600
databricks_job_max_retries               = 2
databricks_job_min_retry_interval_millis = 30000
databricks_job_retry_on_timeout          = true

# Keep scheduling disabled while the pipeline is being developed.
databricks_job_schedule_enabled      = false
databricks_job_schedule_cron         = "0 0 2 * * ?"
databricks_job_schedule_timezone     = "Africa/Johannesburg"
databricks_job_schedule_pause_status = "PAUSED"

# Job compute
databricks_job_cluster_key = "azure-databricks-production-job-cluster"

databricks_job_spark_version = "latest"
databricks_job_node_type_id  = "Standard_DS3_v2"
databricks_job_num_workers   = 1

databricks_job_spark_conf = {}

# Notebook locations
bronze_notebook_path = "/Shared/azure-databricks-production/bronze"
silver_notebook_path = "/Shared/azure-databricks-production/silver"
gold_notebook_path   = "/Shared/azure-databricks-production/gold"

# ============================================================
# Databricks Job Permissions
# ============================================================


# ============================================================
# Databricks Job Monitoring
# ============================================================

databricks_job_notification_email = "pearlzinhleshungube@gmail.com"

databricks_job_notify_on_start            = false
databricks_job_notify_on_success          = true
databricks_job_notify_on_failure          = true
databricks_job_notify_on_duration_warning = false

