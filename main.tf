module "resource_group_az1" {
  ..<omitted>
}

module "keyvault_az1" {
  ..<omitted>
}

module "storage_account_az1" {
  source = "git::ssh://git@code.pruconnect.net:7999/rtsretm/storage-account.git?ref=3.4.7"

  resource_group_name = module.resource_group_az1.name
  app_ref             = var.app_ref

  keyvault_id = module.keyvault_az1.keyvault_id
  settings = {
    enable_storage_account            = "true"
    suffix                            = "001"
    account_tier                      = "Standard"
    account_kind                      = "StorageV2"
    account_replication_type          = "LRS"
    access_tier                       = "Hot"
    is_hns_enabled                    = "false"
    storage_byok                      = "false"
    enable_storage_cmek               = "true"
    subnet_ref                        = "x-app"
    subnet_endpoint                   = ""
    firewall_ip_rules                 = "104.215.179.255,13.67.52.112,13.67.49.200,52.230.85.165,65.52.175.161,65.52.169.31,65.52.171.238"
    static_website                    = "false"
    error_html                        = "error.html"
    index_html                        = "index.html"
    enable_storage_sync_service       = "true"
    min_tls_version                   = "TLS1_2"
    enable_container_delete_retention = "false"
    container_delete_retention_policy = "7"
    enable_blob_delete_retention      = "false"
    blob_delete_retention_policy      = "7"
    last_access_time_enabled          = "true" - set this to true if you are using this to define lifecycle management policy
  }
  cors_rule = [{
    allowed_headers    = "*"
    allowed_methods    = "GET,HEAD,OPTIONS,PUT"
    allowed_origins    = "https://google.ga,http://localhost:4200"
    exposed_headers    = "*"
    max_age_in_seconds = 200
  }]

  firewall_public_ip         = data.terraform_remote_state.level2_azure_firewall.outputs.firewall_pip
  log_analytics_workspace_id = data.terraform_remote_state.level2_hub_monitoring.outputs.la_workspace_id

  resource_tags = var.resource_tags
}
