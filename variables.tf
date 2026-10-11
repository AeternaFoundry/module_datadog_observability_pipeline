variable "observability_pipelines" {
  description = <<EOT
Map of observability_pipelines, attributes below
Required:
    - name
Optional:
    - config (block):
        - destination (optional, block):
            - amazon_opensearch (optional, block):
                - auth (optional, block):
                    - assume_role (optional)
                    - aws_region (optional)
                    - external_id (optional)
                    - session_name (optional)
                    - strategy (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - bulk_index (optional)
            - amazon_s3 (optional, block):
                - auth (optional, block):
                    - assume_role (optional)
                    - external_id (optional)
                    - session_name (optional)
                - bucket (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (required)
                - key_prefix (required)
                - region (required)
                - server_side_encryption (optional)
                - ssekms_key_id (optional)
                - storage_class (required)
            - amazon_s3_generic (optional, block):
                - auth (optional, block):
                    - assume_role (optional)
                    - external_id (optional)
                    - session_name (optional)
                - batch_settings (optional, block):
                    - batch_size (optional)
                    - timeout_secs (optional)
                - bucket (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (optional)
                - encoding (optional, block):
                    - type (required)
                - key_prefix (optional)
                - region (required)
                - server_side_encryption (optional)
                - ssekms_key_id (optional)
                - storage_class (required)
            - amazon_security_lake (optional, block):
                - auth (optional, block):
                    - assume_role (optional)
                    - external_id (optional)
                    - session_name (optional)
                - bucket (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - custom_source_name (required)
                - region (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - azure_storage (optional, block):
                - blob_prefix (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (required)
                - connection_string_key (optional)
                - container_name (required)
            - clickhouse (optional, block):
                - auth (optional, block):
                    - password_key (optional)
                    - strategy (required)
                    - username_key (optional)
                - batch (optional, block):
                    - max_events (optional)
                    - timeout_secs (optional)
                - batch_encoding (optional, block):
                    - allow_nullable_fields (optional)
                    - codec (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (optional)
                - database (optional)
                - date_time_best_effort (optional)
                - endpoint_url_key (optional)
                - format (optional)
                - skip_unknown_fields (optional)
                - table (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - cloud_prem (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - endpoint_url_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
            - crowdstrike_next_gen_siem (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (optional)
                - encoding (required)
                - endpoint_url_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - token_key (optional)
            - databricks_zerobus (optional, block):
                - auth (optional, block):
                    - client_id (required)
                    - client_secret_key (optional)
                - ingestion_endpoint_key (optional)
                - table_name (required)
                - unity_catalog_endpoint_key (optional)
            - datadog_logs (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - routes (optional, block):
                    - api_key_key (required)
                    - buffer (optional, block):
                        - disk (optional, block):
                            - max_size (optional)
                            - when_full (optional)
                        - memory (optional, block):
                            - max_events (optional)
                            - max_size (optional)
                            - when_full (optional)
                    - include (required)
                    - route_id (required)
                    - site (required)
            - datadog_metrics (optional, block):
            - elasticsearch (optional, block):
                - api_version (optional)
                - auth (optional, block):
                    - password_key (optional)
                    - strategy (required)
                    - username_key (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - bulk_index (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (optional)
                - data_stream (optional, block):
                    - auto_routing (optional)
                    - dataset (optional)
                    - dtype (optional)
                    - namespace (optional)
                    - sync_fields (optional)
                - endpoint_url_key (optional)
                - id_key (optional)
                - pipeline (optional)
                - request_retry_partial (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - google_cloud_storage (optional, block):
                - acl (optional)
                - auth (optional, block):
                    - credentials_file (required)
                - bucket (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                    - level (required)
                - key_prefix (optional)
                - metadata (optional, block):
                    - name (required)
                    - value (required)
                - storage_class (required)
            - google_pubsub (optional, block):
                - auth (optional, block):
                    - credentials_file (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - encoding (required)
                - endpoint_url_key (optional)
                - project (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - topic (required)
            - google_secops (optional, block):
                - auth (optional, block):
                    - credentials_file (required)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - customer_id (required)
                - encoding (required)
                - endpoint_url_key (optional)
                - log_type (required)
            - http_client (optional, block):
                - auth_strategy (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional, block):
                    - algorithm (required)
                - custom_key (optional)
                - encoding (required)
                - password_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
                - token_key (optional)
                - uri_key (optional)
                - username_key (optional)
            - id (required)
            - inputs (required)
            - kafka (optional, block):
                - bootstrap_servers_key (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional)
                - encoding (required)
                - headers_key (optional)
                - key_field (optional)
                - librdkafka_option (optional, block):
                    - name (required)
                    - value (required)
                - message_timeout_ms (optional)
                - rate_limit_duration_secs (optional)
                - rate_limit_num (optional)
                - sasl (optional, block):
                    - mechanism (required)
                    - password_key (optional)
                    - username_key (optional)
                - socket_timeout_ms (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - topic (required)
            - microsoft_sentinel (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - client_id (required)
                - client_secret_key (optional)
                - dce_uri_key (optional)
                - dcr_immutable_id (required)
                - table (required)
                - tenant_id (required)
            - new_relic (optional, block):
                - account_id_key (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - license_key_key (optional)
                - region (required)
            - opensearch (optional, block):
                - auth (optional, block):
                    - password_key (optional)
                    - strategy (required)
                    - username_key (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - bulk_index (optional)
                - data_stream (optional, block):
                    - dataset (optional)
                    - dtype (optional)
                    - namespace (optional)
                - endpoint_url_key (optional)
            - opentelemetry (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - http_client_uri_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - prometheus_remote_write (optional, block):
                - auth_strategy (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - default_namespace (optional)
                - endpoint_url_key (optional)
                - password_key (optional)
                - tenant_id (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
                - token_key (optional)
                - username_key (optional)
            - rsyslog (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - endpoint_url_key (optional)
                - keepalive (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - sentinel_one (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - region (required)
                - token_key (optional)
            - socket (optional, block):
                - address_key (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - encoding (required)
                - framing (optional, block):
                    - character_delimited (optional, block):
                        - delimiter (required)
                    - method (required)
                - mode (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
            - splunk_hec (optional, block):
                - auto_extract_timestamp (optional)
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - encoding (required)
                - endpoint_target (optional)
                - endpoint_url_key (optional)
                - index (optional)
                - indexed_fields (optional)
                - sourcetype (optional)
                - token_key (optional)
                - token_strategy (optional)
            - splunk_hec_metrics (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - compression (optional)
                - default_namespace (optional)
                - endpoint_url_key (optional)
                - index (optional)
                - source (optional)
                - sourcetype (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - token_key (optional)
            - sumo_logic (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - encoding (optional)
                - endpoint_url_key (optional)
                - header_custom_field (optional, block):
                    - name (optional)
                    - value (optional)
                - header_host_name (optional)
                - header_source_category (optional)
                - header_source_name (optional)
            - syslog_ng (optional, block):
                - buffer (optional, block):
                    - disk (optional, block):
                        - max_size (optional)
                        - when_full (optional)
                    - memory (optional, block):
                        - max_events (optional)
                        - max_size (optional)
                        - when_full (optional)
                - endpoint_url_key (optional)
                - keepalive (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
        - pipeline_type (optional)
        - processor_group (optional, block):
            - display_name (optional)
            - enabled (required)
            - id (required)
            - include (required)
            - inputs (required)
            - processor (optional, block):
                - add_env_vars (optional, block):
                    - variable (optional, block):
                        - field (required)
                        - name (required)
                - add_fields (optional, block):
                    - field (optional, block):
                        - name (required)
                        - value (required)
                - add_hostname (optional, block):
                - add_metric_tags (optional, block):
                    - tag (optional, block):
                        - name (required)
                        - value (required)
                - aggregate (optional, block):
                    - interval_secs (required)
                    - mode (required)
                - custom_processor (optional, block):
                    - remap (optional, block):
                        - drop_on_error (required)
                        - enabled (required)
                        - include (required)
                        - name (required)
                        - source (required)
                - datadog_tags (optional, block):
                    - action (required)
                    - keys (required)
                    - mode (required)
                - dedupe (optional, block):
                    - fields (required)
                    - mode (required)
                - display_name (optional)
                - enabled (required)
                - enrichment_table (optional, block):
                    - file (optional, block):
                        - encoding (optional, block):
                            - delimiter (required)
                            - includes_headers (optional)
                            - type (required)
                        - key (optional, block):
                            - column (optional)
                            - comparison (optional)
                            - field (optional, block):
                                - event (optional)
                                - secret (optional)
                                - string_path (optional)
                                - vrl (optional)
                        - path (optional)
                    - geoip (optional, block):
                        - key_field (optional)
                        - locale (optional)
                        - path (optional)
                    - reference_table (optional, block):
                        - app_key_key (optional)
                        - columns (optional)
                        - key_field (required)
                        - table_id (required)
                    - target (required)
                - filter (optional, block):
                - generate_datadog_metrics (optional, block):
                    - metric (optional, block):
                        - group_by (optional)
                        - include (required)
                        - metric_type (required)
                        - name (required)
                        - value (optional, block):
                            - field (optional)
                            - strategy (required)
                - generate_metrics (optional, block):
                    - metric (optional, block):
                        - group_by (optional)
                        - include (required)
                        - metric_type (required)
                        - name (required)
                        - value (optional, block):
                            - field (optional)
                            - strategy (required)
                - id (required)
                - include (required)
                - metric_enrichment_table (optional, block):
                    - file (optional, block):
                        - encoding (optional, block):
                            - delimiter (required)
                            - includes_headers (required)
                            - type (required)
                        - key (optional, block):
                            - column (required)
                            - source (optional, block):
                                - name (optional)
                                - type (required)
                        - path (required)
                    - reference_table (optional, block):
                        - app_key_key (optional)
                        - columns (optional)
                        - key (optional, block):
                            - source (optional, block):
                                - name (optional)
                                - type (required)
                        - table_id (required)
                - metric_tags (optional, block):
                    - rule (optional, block):
                        - action (required)
                        - include (required)
                        - keys (required)
                        - mode (required)
                - ocsf_mapper (optional, block):
                    - keep_unmatched (optional)
                    - mapping (optional, block):
                        - custom_mapping (optional, block):
                            - mapping (optional, block):
                                - default (optional)
                                - dest (required)
                                - lookup (optional, block):
                                    - default (optional)
                                    - table (optional, block):
                                        - contains (optional)
                                        - equals (optional)
                                        - equals_source (optional)
                                        - matches (optional)
                                        - not_matches (optional)
                                        - value (optional)
                                - source (optional)
                                - sources (optional)
                                - value (optional)
                            - metadata (optional, block):
                                - class (required)
                                - profiles (optional)
                                - version (required)
                            - version (required)
                        - include (required)
                        - library_mapping (optional)
                - parse_grok (optional, block):
                    - disable_library_rules (optional)
                    - field (optional)
                    - include_rule (optional, block):
                        - include (required)
                        - match_rule (optional, block):
                            - name (required)
                            - rule (required)
                        - support_rule (optional, block):
                            - name (required)
                            - rule (required)
                    - rule (optional, block):
                        - match_rule (optional, block):
                            - name (required)
                            - rule (required)
                        - source (required)
                        - support_rule (optional, block):
                            - name (required)
                            - rule (required)
                - parse_json (optional, block):
                    - field (required)
                - parse_xml (optional, block):
                    - always_use_text_key (optional)
                    - attr_prefix (optional)
                    - field (required)
                    - include_attr (optional)
                    - parse_bool (optional)
                    - parse_null (optional)
                    - parse_number (optional)
                    - text_key (optional)
                - quota (optional, block):
                    - drop_events (optional)
                    - ignore_when_missing_partitions (optional)
                    - limit (optional, block):
                        - enforce (required)
                        - limit (required)
                    - name (required)
                    - overflow_action (optional)
                    - override (optional, block):
                        - field (optional, block):
                            - name (required)
                            - value (required)
                        - limit (optional, block):
                            - enforce (required)
                            - limit (required)
                    - partition_fields (optional)
                    - too_many_buckets_action (optional)
                - reduce (optional, block):
                    - group_by (required)
                    - merge_strategy (optional, block):
                        - path (required)
                        - strategy (required)
                - remove_fields (optional, block):
                    - fields (required)
                - rename_fields (optional, block):
                    - field (optional, block):
                        - destination (required)
                        - preserve_source (required)
                        - source (required)
                - rename_metric_tags (optional, block):
                    - tag (optional, block):
                        - rename_to (required)
                        - tag (required)
                - sample (optional, block):
                    - group_by (optional)
                    - percentage (required)
                - sensitive_data_scanner (optional, block):
                    - rule (optional, block):
                        - keyword_options (optional, block):
                            - keywords (optional)
                            - proximity (optional)
                        - name (required)
                        - on_match (optional, block):
                            - hash (optional, block):
                            - partial_redact (optional, block):
                                - characters (optional)
                                - direction (optional)
                            - redact (optional, block):
                                - replace (optional)
                        - pattern (optional, block):
                            - custom (optional, block):
                                - description (optional)
                                - rule (optional)
                            - library (optional, block):
                                - description (optional)
                                - id (optional)
                                - use_recommended_keywords (optional)
                        - scope (optional, block):
                            - all (optional)
                            - exclude (optional, block):
                                - fields (optional)
                            - include (optional, block):
                                - fields (optional)
                        - tags (optional)
                - split_array (optional, block):
                    - array (optional, block):
                        - field (required)
                        - include (required)
                - tag_cardinality_limit (optional, block):
                    - limit_exceeded_action (required)
                    - per_metric_limit (optional, block):
                        - limit_exceeded_action (optional)
                        - metric_name (required)
                        - override_type (required)
                        - per_tag_limit (optional, block):
                            - override_type (required)
                            - tag_key (required)
                            - value_limit (optional)
                        - value_limit (optional)
                    - tracking_mode (optional, block):
                        - mode (required)
                    - value_limit (required)
                - throttle (optional, block):
                    - group_by (optional)
                    - threshold (required)
                    - window (required)
        - source (optional, block):
            - amazon_data_firehose (optional, block):
                - address_key (optional)
                - auth (optional, block):
                    - assume_role (optional)
                    - external_id (optional)
                    - session_name (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - amazon_s3 (optional, block):
                - auth (optional, block):
                    - assume_role (optional)
                    - external_id (optional)
                    - session_name (optional)
                - compression (optional)
                - region (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - url_key (optional)
            - datadog_agent (optional, block):
                - address_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - fluent_bit (optional, block):
                - address_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - fluentd (optional, block):
                - address_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - google_pubsub (optional, block):
                - auth (optional, block):
                    - credentials_file (required)
                - decoding (required)
                - project (required)
                - subscription (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
            - http_client (optional, block):
                - auth_strategy (optional)
                - custom_key (optional)
                - decoding (required)
                - endpoint_url_key (optional)
                - password_key (optional)
                - scrape_interval_secs (optional)
                - scrape_timeout_secs (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - server_name (optional)
                - token_key (optional)
                - username_key (optional)
            - http_server (optional, block):
                - address_key (optional)
                - auth_strategy (required)
                - decoding (required)
                - password_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
                - username_key (optional)
                - valid_token (optional, block):
                    - enabled (optional)
                    - field_to_add (optional, block):
                        - key (required)
                        - value (required)
                    - path_to_token (optional, block):
                        - header (optional)
                        - location (optional)
                    - token_key (required)
            - id (required)
            - kafka (optional, block):
                - bootstrap_servers_key (optional)
                - group_id (required)
                - librdkafka_option (optional, block):
                    - name (required)
                    - value (required)
                - sasl (optional, block):
                    - mechanism (required)
                    - password_key (optional)
                    - username_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                - topics (required)
            - logstash (optional, block):
                - address_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - opentelemetry (optional, block):
                - grpc_address_key (optional)
                - http_address_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - prometheus_remote_write (optional, block):
                - address_key (optional)
                - auth_strategy (required)
                - password_key (optional)
                - path (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
                - username_key (optional)
                - valid_token (optional, block):
                    - enabled (optional)
                    - path_to_token (optional, block):
                        - header (optional)
                        - location (optional)
                    - token_key (required)
            - rsyslog (optional, block):
                - address_key (optional)
                - mode (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - socket (optional, block):
                - address_key (optional)
                - framing (optional, block):
                    - character_delimited (optional, block):
                        - delimiter (required)
                    - method (required)
                - mode (required)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - splunk_hec (optional, block):
                - address_key (optional)
                - store_hec_token (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
                - valid_token (optional, block):
                    - enabled (optional)
                    - field_to_add (optional, block):
                        - key (required)
                        - value (required)
                    - token_key (required)
            - splunk_tcp (optional, block):
                - address_key (optional)
                - max_connection_duration_secs (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - sumo_logic (optional, block):
                - address_key (optional)
            - syslog_ng (optional, block):
                - address_key (optional)
                - mode (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (required)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - verify_certificate (optional)
            - websocket (optional, block):
                - auth_strategy (required)
                - custom_key (optional)
                - decoding (required)
                - password_key (optional)
                - tls (optional, block):
                    - ca_file (optional)
                    - crt_file (optional)
                    - key_file (optional)
                    - key_pass_key (optional)
                    - mode (required)
                - token_key (optional)
                - uri_key (optional)
                - username_key (optional)
        - use_legacy_search_syntax (optional)
EOT

  type = map(object({
    name = string
    config = optional(list(object({
      destination = optional(list(object({
        amazon_opensearch = optional(list(object({
          auth = optional(list(object({
            assume_role  = optional(string)
            aws_region   = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
            strategy     = string
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          bulk_index = optional(string)
        })))
        amazon_s3 = optional(list(object({
          auth = optional(list(object({
            assume_role  = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
          })))
          bucket = string
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = number
          })))
          key_prefix             = string
          region                 = string
          server_side_encryption = optional(string)
          ssekms_key_id          = optional(string)
          storage_class          = string
        })))
        amazon_s3_generic = optional(list(object({
          auth = optional(list(object({
            assume_role  = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
          })))
          batch_settings = optional(list(object({
            batch_size   = optional(number)
            timeout_secs = optional(number)
          })))
          bucket = string
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = optional(number)
          })))
          encoding = optional(list(object({
            type = string
          })))
          key_prefix             = optional(string)
          region                 = string
          server_side_encryption = optional(string)
          ssekms_key_id          = optional(string)
          storage_class          = string
        })))
        amazon_security_lake = optional(list(object({
          auth = optional(list(object({
            assume_role  = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
          })))
          bucket = string
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          custom_source_name = string
          region             = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        azure_storage = optional(list(object({
          blob_prefix = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = number
          })))
          connection_string_key = optional(string)
          container_name        = string
        })))
        clickhouse = optional(list(object({
          auth = optional(list(object({
            password_key = optional(string)
            strategy     = string
            username_key = optional(string)
          })))
          batch = optional(list(object({
            max_events   = optional(number)
            timeout_secs = optional(number)
          })))
          batch_encoding = optional(list(object({
            allow_nullable_fields = optional(bool)
            codec                 = string
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = optional(number)
          })))
          database              = optional(string)
          date_time_best_effort = optional(bool)
          endpoint_url_key      = optional(string)
          format                = optional(string)
          skip_unknown_fields   = optional(bool)
          table                 = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        cloud_prem = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          endpoint_url_key = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
        })))
        crowdstrike_next_gen_siem = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = optional(number)
          })))
          encoding         = string
          endpoint_url_key = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          token_key = optional(string)
        })))
        databricks_zerobus = optional(list(object({
          auth = optional(list(object({
            client_id         = string
            client_secret_key = optional(string)
          })))
          ingestion_endpoint_key     = optional(string)
          table_name                 = string
          unity_catalog_endpoint_key = optional(string)
        })))
        datadog_logs = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          routes = optional(list(object({
            api_key_key = string
            buffer = optional(list(object({
              disk = optional(list(object({
                max_size  = optional(number)
                when_full = optional(string)
              })))
              memory = optional(list(object({
                max_events = optional(number)
                max_size   = optional(number)
                when_full  = optional(string)
              })))
            })))
            include  = string
            route_id = string
            site     = string
          })))
        })))
        datadog_metrics = optional(list(object({
        })))
        elasticsearch = optional(list(object({
          api_version = optional(string)
          auth = optional(list(object({
            password_key = optional(string)
            strategy     = string
            username_key = optional(string)
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          bulk_index = optional(string)
          compression = optional(list(object({
            algorithm = string
            level     = optional(number)
          })))
          data_stream = optional(list(object({
            auto_routing = optional(bool)
            dataset      = optional(string)
            dtype        = optional(string)
            namespace    = optional(string)
            sync_fields  = optional(bool)
          })))
          endpoint_url_key      = optional(string)
          id_key                = optional(string)
          pipeline              = optional(string)
          request_retry_partial = optional(bool)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        google_cloud_storage = optional(list(object({
          acl = optional(string)
          auth = optional(list(object({
            credentials_file = string
          })))
          bucket = string
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
            level     = number
          })))
          key_prefix = optional(string)
          metadata = optional(list(object({
            name  = string
            value = string
          })))
          storage_class = string
        })))
        google_pubsub = optional(list(object({
          auth = optional(list(object({
            credentials_file = string
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          encoding         = string
          endpoint_url_key = optional(string)
          project          = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          topic = string
        })))
        google_secops = optional(list(object({
          auth = optional(list(object({
            credentials_file = string
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          customer_id      = string
          encoding         = string
          endpoint_url_key = optional(string)
          log_type         = string
        })))
        http_client = optional(list(object({
          auth_strategy = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(list(object({
            algorithm = string
          })))
          custom_key   = optional(string)
          encoding     = string
          password_key = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
          token_key    = optional(string)
          uri_key      = optional(string)
          username_key = optional(string)
        })))
        id     = string
        inputs = list(string)
        kafka = optional(list(object({
          bootstrap_servers_key = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression = optional(string)
          encoding    = string
          headers_key = optional(string)
          key_field   = optional(string)
          librdkafka_option = optional(list(object({
            name  = string
            value = string
          })))
          message_timeout_ms       = optional(number)
          rate_limit_duration_secs = optional(number)
          rate_limit_num           = optional(number)
          sasl = optional(list(object({
            mechanism    = string
            password_key = optional(string)
            username_key = optional(string)
          })))
          socket_timeout_ms = optional(number)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          topic = string
        })))
        microsoft_sentinel = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          client_id         = string
          client_secret_key = optional(string)
          dce_uri_key       = optional(string)
          dcr_immutable_id  = string
          table             = string
          tenant_id         = string
        })))
        new_relic = optional(list(object({
          account_id_key = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          license_key_key = optional(string)
          region          = string
        })))
        opensearch = optional(list(object({
          auth = optional(list(object({
            password_key = optional(string)
            strategy     = string
            username_key = optional(string)
          })))
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          bulk_index = optional(string)
          data_stream = optional(list(object({
            dataset   = optional(string)
            dtype     = optional(string)
            namespace = optional(string)
          })))
          endpoint_url_key = optional(string)
        })))
        opentelemetry = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          http_client_uri_key = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        prometheus_remote_write = optional(list(object({
          auth_strategy = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          default_namespace = optional(string)
          endpoint_url_key  = optional(string)
          password_key      = optional(string)
          tenant_id         = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
          token_key    = optional(string)
          username_key = optional(string)
        })))
        rsyslog = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          endpoint_url_key = optional(string)
          keepalive        = optional(number)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        sentinel_one = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          region    = string
          token_key = optional(string)
        })))
        socket = optional(list(object({
          address_key = optional(string)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          encoding = string
          framing = optional(list(object({
            character_delimited = optional(list(object({
              delimiter = string
            })))
            method = string
          })))
          mode = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
        })))
        splunk_hec = optional(list(object({
          auto_extract_timestamp = optional(bool)
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          encoding         = string
          endpoint_target  = optional(string)
          endpoint_url_key = optional(string)
          index            = optional(string)
          indexed_fields   = optional(list(string))
          sourcetype       = optional(string)
          token_key        = optional(string)
          token_strategy   = optional(string)
        })))
        splunk_hec_metrics = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          compression       = optional(string)
          default_namespace = optional(string)
          endpoint_url_key  = optional(string)
          index             = optional(string)
          source            = optional(string)
          sourcetype        = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          token_key = optional(string)
        })))
        sumo_logic = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          encoding         = optional(string)
          endpoint_url_key = optional(string)
          header_custom_field = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })))
          header_host_name       = optional(string)
          header_source_category = optional(string)
          header_source_name     = optional(string)
        })))
        syslog_ng = optional(list(object({
          buffer = optional(list(object({
            disk = optional(list(object({
              max_size  = optional(number)
              when_full = optional(string)
            })))
            memory = optional(list(object({
              max_events = optional(number)
              max_size   = optional(number)
              when_full  = optional(string)
            })))
          })))
          endpoint_url_key = optional(string)
          keepalive        = optional(number)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
        })))
      })))
      pipeline_type = optional(string)
      processor_group = optional(list(object({
        display_name = optional(string)
        enabled      = bool
        id           = string
        include      = string
        inputs       = list(string)
        processor = optional(list(object({
          add_env_vars = optional(list(object({
            variable = optional(list(object({
              field = string
              name  = string
            })))
          })))
          add_fields = optional(list(object({
            field = optional(list(object({
              name  = string
              value = string
            })))
          })))
          add_hostname = optional(list(object({
          })))
          add_metric_tags = optional(list(object({
            tag = optional(list(object({
              name  = string
              value = string
            })))
          })))
          aggregate = optional(list(object({
            interval_secs = number
            mode          = string
          })))
          custom_processor = optional(list(object({
            remap = optional(list(object({
              drop_on_error = bool
              enabled       = bool
              include       = string
              name          = string
              source        = string
            })))
          })))
          datadog_tags = optional(list(object({
            action = string
            keys   = list(string)
            mode   = string
          })))
          dedupe = optional(list(object({
            fields = list(string)
            mode   = string
          })))
          display_name = optional(string)
          enabled      = bool
          enrichment_table = optional(list(object({
            file = optional(list(object({
              encoding = optional(list(object({
                delimiter        = string
                includes_headers = optional(bool)
                type             = string
              })))
              key = optional(list(object({
                column     = optional(string)
                comparison = optional(string)
                field = optional(list(object({
                  event       = optional(string)
                  secret      = optional(string)
                  string_path = optional(string)
                  vrl         = optional(string)
                })))
              })))
              path = optional(string)
            })))
            geoip = optional(list(object({
              key_field = optional(string)
              locale    = optional(string)
              path      = optional(string)
            })))
            reference_table = optional(list(object({
              app_key_key = optional(string)
              columns     = optional(list(string))
              key_field   = string
              table_id    = string
            })))
            target = string
          })))
          filter = optional(list(object({
          })))
          generate_datadog_metrics = optional(list(object({
            metric = optional(list(object({
              group_by    = optional(list(string))
              include     = string
              metric_type = string
              name        = string
              value = optional(list(object({
                field    = optional(string)
                strategy = string
              })))
            })))
          })))
          generate_metrics = optional(list(object({
            metric = optional(list(object({
              group_by    = optional(list(string))
              include     = string
              metric_type = string
              name        = string
              value = optional(list(object({
                field    = optional(string)
                strategy = string
              })))
            })))
          })))
          id      = string
          include = string
          metric_enrichment_table = optional(list(object({
            file = optional(list(object({
              encoding = optional(list(object({
                delimiter        = string
                includes_headers = bool
                type             = string
              })))
              key = optional(list(object({
                column = string
                source = optional(list(object({
                  name = optional(string)
                  type = string
                })))
              })))
              path = string
            })))
            reference_table = optional(list(object({
              app_key_key = optional(string)
              columns     = optional(list(string))
              key = optional(list(object({
                source = optional(list(object({
                  name = optional(string)
                  type = string
                })))
              })))
              table_id = string
            })))
          })))
          metric_tags = optional(list(object({
            rule = optional(list(object({
              action  = string
              include = string
              keys    = list(string)
              mode    = string
            })))
          })))
          ocsf_mapper = optional(list(object({
            keep_unmatched = optional(bool)
            mapping = optional(list(object({
              custom_mapping = optional(list(object({
                mapping = optional(list(object({
                  default = optional(string)
                  dest    = string
                  lookup = optional(list(object({
                    default = optional(string)
                    table = optional(list(object({
                      contains      = optional(string)
                      equals        = optional(string)
                      equals_source = optional(string)
                      matches       = optional(string)
                      not_matches   = optional(string)
                      value         = optional(string)
                    })))
                  })))
                  source  = optional(string)
                  sources = optional(list(string))
                  value   = optional(string)
                })))
                metadata = optional(list(object({
                  class    = string
                  profiles = optional(list(string))
                  version  = string
                })))
                version = number
              })))
              include         = string
              library_mapping = optional(string)
            })))
          })))
          parse_grok = optional(list(object({
            disable_library_rules = optional(bool)
            field                 = optional(string)
            include_rule = optional(list(object({
              include = string
              match_rule = optional(list(object({
                name = string
                rule = string
              })))
              support_rule = optional(list(object({
                name = string
                rule = string
              })))
            })))
            rule = optional(list(object({
              match_rule = optional(list(object({
                name = string
                rule = string
              })))
              source = string
              support_rule = optional(list(object({
                name = string
                rule = string
              })))
            })))
          })))
          parse_json = optional(list(object({
            field = string
          })))
          parse_xml = optional(list(object({
            always_use_text_key = optional(bool)
            attr_prefix         = optional(string)
            field               = string
            include_attr        = optional(bool)
            parse_bool          = optional(bool)
            parse_null          = optional(bool)
            parse_number        = optional(bool)
            text_key            = optional(string)
          })))
          quota = optional(list(object({
            drop_events                    = optional(bool)
            ignore_when_missing_partitions = optional(bool)
            limit = optional(list(object({
              enforce = string
              limit   = number
            })))
            name            = string
            overflow_action = optional(string)
            override = optional(list(object({
              field = optional(list(object({
                name  = string
                value = string
              })))
              limit = optional(list(object({
                enforce = string
                limit   = number
              })))
            })))
            partition_fields        = optional(list(string))
            too_many_buckets_action = optional(string)
          })))
          reduce = optional(list(object({
            group_by = list(string)
            merge_strategy = optional(list(object({
              path     = string
              strategy = string
            })))
          })))
          remove_fields = optional(list(object({
            fields = list(string)
          })))
          rename_fields = optional(list(object({
            field = optional(list(object({
              destination     = string
              preserve_source = bool
              source          = string
            })))
          })))
          rename_metric_tags = optional(list(object({
            tag = optional(list(object({
              rename_to = string
              tag       = string
            })))
          })))
          sample = optional(list(object({
            group_by   = optional(list(string))
            percentage = number
          })))
          sensitive_data_scanner = optional(list(object({
            rule = optional(list(object({
              keyword_options = optional(list(object({
                keywords  = optional(list(string))
                proximity = optional(number)
              })))
              name = string
              on_match = optional(list(object({
                hash = optional(list(object({
                })))
                partial_redact = optional(list(object({
                  characters = optional(number)
                  direction  = optional(string)
                })))
                redact = optional(list(object({
                  replace = optional(string)
                })))
              })))
              pattern = optional(list(object({
                custom = optional(list(object({
                  description = optional(string)
                  rule        = optional(string)
                })))
                library = optional(list(object({
                  description              = optional(string)
                  id                       = optional(string)
                  use_recommended_keywords = optional(bool)
                })))
              })))
              scope = optional(list(object({
                all = optional(bool)
                exclude = optional(list(object({
                  fields = optional(list(string))
                })))
                include = optional(list(object({
                  fields = optional(list(string))
                })))
              })))
              tags = optional(list(string))
            })))
          })))
          split_array = optional(list(object({
            array = optional(list(object({
              field   = string
              include = string
            })))
          })))
          tag_cardinality_limit = optional(list(object({
            limit_exceeded_action = string
            per_metric_limit = optional(list(object({
              limit_exceeded_action = optional(string)
              metric_name           = string
              override_type         = string
              per_tag_limit = optional(list(object({
                override_type = string
                tag_key       = string
                value_limit   = optional(number)
              })))
              value_limit = optional(number)
            })))
            tracking_mode = optional(list(object({
              mode = string
            })))
            value_limit = number
          })))
          throttle = optional(list(object({
            group_by  = optional(list(string))
            threshold = number
            window    = number
          })))
        })))
      })))
      source = optional(list(object({
        amazon_data_firehose = optional(list(object({
          address_key = optional(string)
          auth = optional(list(object({
            assume_role  = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
          })))
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        amazon_s3 = optional(list(object({
          auth = optional(list(object({
            assume_role  = optional(string)
            external_id  = optional(string)
            session_name = optional(string)
          })))
          compression = optional(string)
          region      = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          url_key = optional(string)
        })))
        datadog_agent = optional(list(object({
          address_key = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        fluent_bit = optional(list(object({
          address_key = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        fluentd = optional(list(object({
          address_key = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        google_pubsub = optional(list(object({
          auth = optional(list(object({
            credentials_file = string
          })))
          decoding     = string
          project      = string
          subscription = string
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
        })))
        http_client = optional(list(object({
          auth_strategy        = optional(string)
          custom_key           = optional(string)
          decoding             = string
          endpoint_url_key     = optional(string)
          password_key         = optional(string)
          scrape_interval_secs = optional(number)
          scrape_timeout_secs  = optional(number)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
            server_name  = optional(string)
          })))
          token_key    = optional(string)
          username_key = optional(string)
        })))
        http_server = optional(list(object({
          address_key   = optional(string)
          auth_strategy = string
          decoding      = string
          password_key  = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
          username_key = optional(string)
          valid_token = optional(list(object({
            enabled = optional(bool)
            field_to_add = optional(list(object({
              key   = string
              value = string
            })))
            path_to_token = optional(list(object({
              header   = optional(string)
              location = optional(string)
            })))
            token_key = string
          })))
        })))
        id = string
        kafka = optional(list(object({
          bootstrap_servers_key = optional(string)
          group_id              = string
          librdkafka_option = optional(list(object({
            name  = string
            value = string
          })))
          sasl = optional(list(object({
            mechanism    = string
            password_key = optional(string)
            username_key = optional(string)
          })))
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = string
            key_file     = optional(string)
            key_pass_key = optional(string)
          })))
          topics = list(string)
        })))
        logstash = optional(list(object({
          address_key = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        opentelemetry = optional(list(object({
          grpc_address_key = optional(string)
          http_address_key = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        prometheus_remote_write = optional(list(object({
          address_key   = optional(string)
          auth_strategy = string
          password_key  = optional(string)
          path          = string
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
          username_key = optional(string)
          valid_token = optional(list(object({
            enabled = optional(bool)
            path_to_token = optional(list(object({
              header   = optional(string)
              location = optional(string)
            })))
            token_key = string
          })))
        })))
        rsyslog = optional(list(object({
          address_key = optional(string)
          mode        = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        socket = optional(list(object({
          address_key = optional(string)
          framing = optional(list(object({
            character_delimited = optional(list(object({
              delimiter = string
            })))
            method = string
          })))
          mode = string
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        splunk_hec = optional(list(object({
          address_key     = optional(string)
          store_hec_token = optional(bool)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
          valid_token = optional(list(object({
            enabled = optional(bool)
            field_to_add = optional(list(object({
              key   = string
              value = string
            })))
            token_key = string
          })))
        })))
        splunk_tcp = optional(list(object({
          address_key                  = optional(string)
          max_connection_duration_secs = optional(number)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        sumo_logic = optional(list(object({
          address_key = optional(string)
        })))
        syslog_ng = optional(list(object({
          address_key = optional(string)
          mode        = optional(string)
          tls = optional(list(object({
            ca_file            = optional(string)
            crt_file           = string
            key_file           = optional(string)
            key_pass_key       = optional(string)
            verify_certificate = optional(bool)
          })))
        })))
        websocket = optional(list(object({
          auth_strategy = string
          custom_key    = optional(string)
          decoding      = string
          password_key  = optional(string)
          tls = optional(list(object({
            ca_file      = optional(string)
            crt_file     = optional(string)
            key_file     = optional(string)
            key_pass_key = optional(string)
            mode         = string
          })))
          token_key    = optional(string)
          uri_key      = optional(string)
          username_key = optional(string)
        })))
      })))
      use_legacy_search_syntax = optional(bool)
    })))
  }))
}

