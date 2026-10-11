output "observability_pipelines_id" {
  description = "Map of id values across all observability_pipelines, keyed the same as var.observability_pipelines except keys with no id are omitted"
  value       = { for k, v in datadog_observability_pipeline.observability_pipelines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "observability_pipelines_config" {
  description = "Map of config values across all observability_pipelines, keyed the same as var.observability_pipelines except keys with no config are omitted"
  value       = { for k, v in datadog_observability_pipeline.observability_pipelines : k => v.config if v.config != null && length(v.config) > 0 }
}
output "observability_pipelines_name" {
  description = "Map of name values across all observability_pipelines, keyed the same as var.observability_pipelines except keys with no name are omitted"
  value       = { for k, v in datadog_observability_pipeline.observability_pipelines : k => v.name if v.name != null && length(v.name) > 0 }
}

