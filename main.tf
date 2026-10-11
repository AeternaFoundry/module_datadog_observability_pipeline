resource "datadog_observability_pipeline" "observability_pipelines" {
  for_each = var.observability_pipelines

  name = each.value.name

  dynamic "config" {
    for_each = each.value.config != null ? each.value.config : []
    content {
      dynamic "destination" {
        for_each = config.value.destination != null ? config.value.destination : []
        content {
          dynamic "amazon_opensearch" {
            for_each = destination.value.amazon_opensearch != null ? destination.value.amazon_opensearch : []
            content {
              dynamic "auth" {
                for_each = amazon_opensearch.value.auth != null ? amazon_opensearch.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  aws_region   = auth.value.aws_region
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                  strategy     = auth.value.strategy
                }
              }
              dynamic "buffer" {
                for_each = amazon_opensearch.value.buffer != null ? amazon_opensearch.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              bulk_index = amazon_opensearch.value.bulk_index
            }
          }
          dynamic "amazon_s3" {
            for_each = destination.value.amazon_s3 != null ? destination.value.amazon_s3 : []
            content {
              dynamic "auth" {
                for_each = amazon_s3.value.auth != null ? amazon_s3.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                }
              }
              bucket = amazon_s3.value.bucket
              dynamic "buffer" {
                for_each = amazon_s3.value.buffer != null ? amazon_s3.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = amazon_s3.value.compression != null ? amazon_s3.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              key_prefix             = amazon_s3.value.key_prefix
              region                 = amazon_s3.value.region
              server_side_encryption = amazon_s3.value.server_side_encryption
              ssekms_key_id          = amazon_s3.value.ssekms_key_id
              storage_class          = amazon_s3.value.storage_class
            }
          }
          dynamic "amazon_s3_generic" {
            for_each = destination.value.amazon_s3_generic != null ? destination.value.amazon_s3_generic : []
            content {
              dynamic "auth" {
                for_each = amazon_s3_generic.value.auth != null ? amazon_s3_generic.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                }
              }
              dynamic "batch_settings" {
                for_each = amazon_s3_generic.value.batch_settings != null ? amazon_s3_generic.value.batch_settings : []
                content {
                  batch_size   = batch_settings.value.batch_size
                  timeout_secs = batch_settings.value.timeout_secs
                }
              }
              bucket = amazon_s3_generic.value.bucket
              dynamic "buffer" {
                for_each = amazon_s3_generic.value.buffer != null ? amazon_s3_generic.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = amazon_s3_generic.value.compression != null ? amazon_s3_generic.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              dynamic "encoding" {
                for_each = amazon_s3_generic.value.encoding != null ? amazon_s3_generic.value.encoding : []
                content {
                  type = encoding.value.type
                }
              }
              key_prefix             = amazon_s3_generic.value.key_prefix
              region                 = amazon_s3_generic.value.region
              server_side_encryption = amazon_s3_generic.value.server_side_encryption
              ssekms_key_id          = amazon_s3_generic.value.ssekms_key_id
              storage_class          = amazon_s3_generic.value.storage_class
            }
          }
          dynamic "amazon_security_lake" {
            for_each = destination.value.amazon_security_lake != null ? destination.value.amazon_security_lake : []
            content {
              dynamic "auth" {
                for_each = amazon_security_lake.value.auth != null ? amazon_security_lake.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                }
              }
              bucket = amazon_security_lake.value.bucket
              dynamic "buffer" {
                for_each = amazon_security_lake.value.buffer != null ? amazon_security_lake.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              custom_source_name = amazon_security_lake.value.custom_source_name
              region             = amazon_security_lake.value.region
              dynamic "tls" {
                for_each = amazon_security_lake.value.tls != null ? amazon_security_lake.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "azure_storage" {
            for_each = destination.value.azure_storage != null ? destination.value.azure_storage : []
            content {
              blob_prefix = azure_storage.value.blob_prefix
              dynamic "buffer" {
                for_each = azure_storage.value.buffer != null ? azure_storage.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = azure_storage.value.compression != null ? azure_storage.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              connection_string_key = azure_storage.value.connection_string_key
              container_name        = azure_storage.value.container_name
            }
          }
          dynamic "clickhouse" {
            for_each = destination.value.clickhouse != null ? destination.value.clickhouse : []
            content {
              dynamic "auth" {
                for_each = clickhouse.value.auth != null ? clickhouse.value.auth : []
                content {
                  password_key = auth.value.password_key
                  strategy     = auth.value.strategy
                  username_key = auth.value.username_key
                }
              }
              dynamic "batch" {
                for_each = clickhouse.value.batch != null ? clickhouse.value.batch : []
                content {
                  max_events   = batch.value.max_events
                  timeout_secs = batch.value.timeout_secs
                }
              }
              dynamic "batch_encoding" {
                for_each = clickhouse.value.batch_encoding != null ? clickhouse.value.batch_encoding : []
                content {
                  allow_nullable_fields = batch_encoding.value.allow_nullable_fields
                  codec                 = batch_encoding.value.codec
                }
              }
              dynamic "buffer" {
                for_each = clickhouse.value.buffer != null ? clickhouse.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = clickhouse.value.compression != null ? clickhouse.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              database              = clickhouse.value.database
              date_time_best_effort = clickhouse.value.date_time_best_effort
              endpoint_url_key      = clickhouse.value.endpoint_url_key
              format                = clickhouse.value.format
              skip_unknown_fields   = clickhouse.value.skip_unknown_fields
              table                 = clickhouse.value.table
              dynamic "tls" {
                for_each = clickhouse.value.tls != null ? clickhouse.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "cloud_prem" {
            for_each = destination.value.cloud_prem != null ? destination.value.cloud_prem : []
            content {
              dynamic "buffer" {
                for_each = cloud_prem.value.buffer != null ? cloud_prem.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              endpoint_url_key = cloud_prem.value.endpoint_url_key
              dynamic "tls" {
                for_each = cloud_prem.value.tls != null ? cloud_prem.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
            }
          }
          dynamic "crowdstrike_next_gen_siem" {
            for_each = destination.value.crowdstrike_next_gen_siem != null ? destination.value.crowdstrike_next_gen_siem : []
            content {
              dynamic "buffer" {
                for_each = crowdstrike_next_gen_siem.value.buffer != null ? crowdstrike_next_gen_siem.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = crowdstrike_next_gen_siem.value.compression != null ? crowdstrike_next_gen_siem.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              encoding         = crowdstrike_next_gen_siem.value.encoding
              endpoint_url_key = crowdstrike_next_gen_siem.value.endpoint_url_key
              dynamic "tls" {
                for_each = crowdstrike_next_gen_siem.value.tls != null ? crowdstrike_next_gen_siem.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              token_key = crowdstrike_next_gen_siem.value.token_key
            }
          }
          dynamic "databricks_zerobus" {
            for_each = destination.value.databricks_zerobus != null ? destination.value.databricks_zerobus : []
            content {
              dynamic "auth" {
                for_each = databricks_zerobus.value.auth != null ? databricks_zerobus.value.auth : []
                content {
                  client_id         = auth.value.client_id
                  client_secret_key = auth.value.client_secret_key
                }
              }
              ingestion_endpoint_key     = databricks_zerobus.value.ingestion_endpoint_key
              table_name                 = databricks_zerobus.value.table_name
              unity_catalog_endpoint_key = databricks_zerobus.value.unity_catalog_endpoint_key
            }
          }
          dynamic "datadog_logs" {
            for_each = destination.value.datadog_logs != null ? destination.value.datadog_logs : []
            content {
              dynamic "buffer" {
                for_each = datadog_logs.value.buffer != null ? datadog_logs.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "routes" {
                for_each = datadog_logs.value.routes != null ? datadog_logs.value.routes : []
                content {
                  api_key_key = routes.value.api_key_key
                  dynamic "buffer" {
                    for_each = routes.value.buffer != null ? routes.value.buffer : []
                    content {
                      dynamic "disk" {
                        for_each = buffer.value.disk != null ? buffer.value.disk : []
                        content {
                          max_size  = disk.value.max_size
                          when_full = disk.value.when_full
                        }
                      }
                      dynamic "memory" {
                        for_each = buffer.value.memory != null ? buffer.value.memory : []
                        content {
                          max_events = memory.value.max_events
                          max_size   = memory.value.max_size
                          when_full  = memory.value.when_full
                        }
                      }
                    }
                  }
                  include  = routes.value.include
                  route_id = routes.value.route_id
                  site     = routes.value.site
                }
              }
            }
          }
          dynamic "datadog_metrics" {
            for_each = destination.value.datadog_metrics != null ? destination.value.datadog_metrics : []
            content {
            }
          }
          dynamic "elasticsearch" {
            for_each = destination.value.elasticsearch != null ? destination.value.elasticsearch : []
            content {
              api_version = elasticsearch.value.api_version
              dynamic "auth" {
                for_each = elasticsearch.value.auth != null ? elasticsearch.value.auth : []
                content {
                  password_key = auth.value.password_key
                  strategy     = auth.value.strategy
                  username_key = auth.value.username_key
                }
              }
              dynamic "buffer" {
                for_each = elasticsearch.value.buffer != null ? elasticsearch.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              bulk_index = elasticsearch.value.bulk_index
              dynamic "compression" {
                for_each = elasticsearch.value.compression != null ? elasticsearch.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              dynamic "data_stream" {
                for_each = elasticsearch.value.data_stream != null ? elasticsearch.value.data_stream : []
                content {
                  auto_routing = data_stream.value.auto_routing
                  dataset      = data_stream.value.dataset
                  dtype        = data_stream.value.dtype
                  namespace    = data_stream.value.namespace
                  sync_fields  = data_stream.value.sync_fields
                }
              }
              endpoint_url_key      = elasticsearch.value.endpoint_url_key
              id_key                = elasticsearch.value.id_key
              pipeline              = elasticsearch.value.pipeline
              request_retry_partial = elasticsearch.value.request_retry_partial
              dynamic "tls" {
                for_each = elasticsearch.value.tls != null ? elasticsearch.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "google_cloud_storage" {
            for_each = destination.value.google_cloud_storage != null ? destination.value.google_cloud_storage : []
            content {
              acl = google_cloud_storage.value.acl
              dynamic "auth" {
                for_each = google_cloud_storage.value.auth != null ? google_cloud_storage.value.auth : []
                content {
                  credentials_file = auth.value.credentials_file
                }
              }
              bucket = google_cloud_storage.value.bucket
              dynamic "buffer" {
                for_each = google_cloud_storage.value.buffer != null ? google_cloud_storage.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = google_cloud_storage.value.compression != null ? google_cloud_storage.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                  level     = compression.value.level
                }
              }
              key_prefix = google_cloud_storage.value.key_prefix
              dynamic "metadata" {
                for_each = google_cloud_storage.value.metadata != null ? google_cloud_storage.value.metadata : []
                content {
                  name  = metadata.value.name
                  value = metadata.value.value
                }
              }
              storage_class = google_cloud_storage.value.storage_class
            }
          }
          dynamic "google_pubsub" {
            for_each = destination.value.google_pubsub != null ? destination.value.google_pubsub : []
            content {
              dynamic "auth" {
                for_each = google_pubsub.value.auth != null ? google_pubsub.value.auth : []
                content {
                  credentials_file = auth.value.credentials_file
                }
              }
              dynamic "buffer" {
                for_each = google_pubsub.value.buffer != null ? google_pubsub.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              encoding         = google_pubsub.value.encoding
              endpoint_url_key = google_pubsub.value.endpoint_url_key
              project          = google_pubsub.value.project
              dynamic "tls" {
                for_each = google_pubsub.value.tls != null ? google_pubsub.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              topic = google_pubsub.value.topic
            }
          }
          dynamic "google_secops" {
            for_each = destination.value.google_secops != null ? destination.value.google_secops : []
            content {
              dynamic "auth" {
                for_each = google_secops.value.auth != null ? google_secops.value.auth : []
                content {
                  credentials_file = auth.value.credentials_file
                }
              }
              dynamic "buffer" {
                for_each = google_secops.value.buffer != null ? google_secops.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              customer_id      = google_secops.value.customer_id
              encoding         = google_secops.value.encoding
              endpoint_url_key = google_secops.value.endpoint_url_key
              log_type         = google_secops.value.log_type
            }
          }
          dynamic "http_client" {
            for_each = destination.value.http_client != null ? destination.value.http_client : []
            content {
              auth_strategy = http_client.value.auth_strategy
              dynamic "buffer" {
                for_each = http_client.value.buffer != null ? http_client.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              dynamic "compression" {
                for_each = http_client.value.compression != null ? http_client.value.compression : []
                content {
                  algorithm = compression.value.algorithm
                }
              }
              custom_key   = http_client.value.custom_key
              encoding     = http_client.value.encoding
              password_key = http_client.value.password_key
              dynamic "tls" {
                for_each = http_client.value.tls != null ? http_client.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
              token_key    = http_client.value.token_key
              uri_key      = http_client.value.uri_key
              username_key = http_client.value.username_key
            }
          }
          id     = destination.value.id
          inputs = destination.value.inputs
          dynamic "kafka" {
            for_each = destination.value.kafka != null ? destination.value.kafka : []
            content {
              bootstrap_servers_key = kafka.value.bootstrap_servers_key
              dynamic "buffer" {
                for_each = kafka.value.buffer != null ? kafka.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              compression = kafka.value.compression
              encoding    = kafka.value.encoding
              headers_key = kafka.value.headers_key
              key_field   = kafka.value.key_field
              dynamic "librdkafka_option" {
                for_each = kafka.value.librdkafka_option != null ? kafka.value.librdkafka_option : []
                content {
                  name  = librdkafka_option.value.name
                  value = librdkafka_option.value.value
                }
              }
              message_timeout_ms       = kafka.value.message_timeout_ms
              rate_limit_duration_secs = kafka.value.rate_limit_duration_secs
              rate_limit_num           = kafka.value.rate_limit_num
              dynamic "sasl" {
                for_each = kafka.value.sasl != null ? kafka.value.sasl : []
                content {
                  mechanism    = sasl.value.mechanism
                  password_key = sasl.value.password_key
                  username_key = sasl.value.username_key
                }
              }
              socket_timeout_ms = kafka.value.socket_timeout_ms
              dynamic "tls" {
                for_each = kafka.value.tls != null ? kafka.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              topic = kafka.value.topic
            }
          }
          dynamic "microsoft_sentinel" {
            for_each = destination.value.microsoft_sentinel != null ? destination.value.microsoft_sentinel : []
            content {
              dynamic "buffer" {
                for_each = microsoft_sentinel.value.buffer != null ? microsoft_sentinel.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              client_id         = microsoft_sentinel.value.client_id
              client_secret_key = microsoft_sentinel.value.client_secret_key
              dce_uri_key       = microsoft_sentinel.value.dce_uri_key
              dcr_immutable_id  = microsoft_sentinel.value.dcr_immutable_id
              table             = microsoft_sentinel.value.table
              tenant_id         = microsoft_sentinel.value.tenant_id
            }
          }
          dynamic "new_relic" {
            for_each = destination.value.new_relic != null ? destination.value.new_relic : []
            content {
              account_id_key = new_relic.value.account_id_key
              dynamic "buffer" {
                for_each = new_relic.value.buffer != null ? new_relic.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              license_key_key = new_relic.value.license_key_key
              region          = new_relic.value.region
            }
          }
          dynamic "opensearch" {
            for_each = destination.value.opensearch != null ? destination.value.opensearch : []
            content {
              dynamic "auth" {
                for_each = opensearch.value.auth != null ? opensearch.value.auth : []
                content {
                  password_key = auth.value.password_key
                  strategy     = auth.value.strategy
                  username_key = auth.value.username_key
                }
              }
              dynamic "buffer" {
                for_each = opensearch.value.buffer != null ? opensearch.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              bulk_index = opensearch.value.bulk_index
              dynamic "data_stream" {
                for_each = opensearch.value.data_stream != null ? opensearch.value.data_stream : []
                content {
                  dataset   = data_stream.value.dataset
                  dtype     = data_stream.value.dtype
                  namespace = data_stream.value.namespace
                }
              }
              endpoint_url_key = opensearch.value.endpoint_url_key
            }
          }
          dynamic "opentelemetry" {
            for_each = destination.value.opentelemetry != null ? destination.value.opentelemetry : []
            content {
              dynamic "buffer" {
                for_each = opentelemetry.value.buffer != null ? opentelemetry.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              http_client_uri_key = opentelemetry.value.http_client_uri_key
              dynamic "tls" {
                for_each = opentelemetry.value.tls != null ? opentelemetry.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "prometheus_remote_write" {
            for_each = destination.value.prometheus_remote_write != null ? destination.value.prometheus_remote_write : []
            content {
              auth_strategy = prometheus_remote_write.value.auth_strategy
              dynamic "buffer" {
                for_each = prometheus_remote_write.value.buffer != null ? prometheus_remote_write.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              default_namespace = prometheus_remote_write.value.default_namespace
              endpoint_url_key  = prometheus_remote_write.value.endpoint_url_key
              password_key      = prometheus_remote_write.value.password_key
              tenant_id         = prometheus_remote_write.value.tenant_id
              dynamic "tls" {
                for_each = prometheus_remote_write.value.tls != null ? prometheus_remote_write.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
              token_key    = prometheus_remote_write.value.token_key
              username_key = prometheus_remote_write.value.username_key
            }
          }
          dynamic "rsyslog" {
            for_each = destination.value.rsyslog != null ? destination.value.rsyslog : []
            content {
              dynamic "buffer" {
                for_each = rsyslog.value.buffer != null ? rsyslog.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              endpoint_url_key = rsyslog.value.endpoint_url_key
              keepalive        = rsyslog.value.keepalive
              dynamic "tls" {
                for_each = rsyslog.value.tls != null ? rsyslog.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "sentinel_one" {
            for_each = destination.value.sentinel_one != null ? destination.value.sentinel_one : []
            content {
              dynamic "buffer" {
                for_each = sentinel_one.value.buffer != null ? sentinel_one.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              region    = sentinel_one.value.region
              token_key = sentinel_one.value.token_key
            }
          }
          dynamic "socket" {
            for_each = destination.value.socket != null ? destination.value.socket : []
            content {
              address_key = socket.value.address_key
              dynamic "buffer" {
                for_each = socket.value.buffer != null ? socket.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              encoding = socket.value.encoding
              dynamic "framing" {
                for_each = socket.value.framing != null ? socket.value.framing : []
                content {
                  dynamic "character_delimited" {
                    for_each = framing.value.character_delimited != null ? framing.value.character_delimited : []
                    content {
                      delimiter = character_delimited.value.delimiter
                    }
                  }
                  method = framing.value.method
                }
              }
              mode = socket.value.mode
              dynamic "tls" {
                for_each = socket.value.tls != null ? socket.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
            }
          }
          dynamic "splunk_hec" {
            for_each = destination.value.splunk_hec != null ? destination.value.splunk_hec : []
            content {
              auto_extract_timestamp = splunk_hec.value.auto_extract_timestamp
              dynamic "buffer" {
                for_each = splunk_hec.value.buffer != null ? splunk_hec.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              encoding         = splunk_hec.value.encoding
              endpoint_target  = splunk_hec.value.endpoint_target
              endpoint_url_key = splunk_hec.value.endpoint_url_key
              index            = splunk_hec.value.index
              indexed_fields   = splunk_hec.value.indexed_fields
              sourcetype       = splunk_hec.value.sourcetype
              token_key        = splunk_hec.value.token_key
              token_strategy   = splunk_hec.value.token_strategy
            }
          }
          dynamic "splunk_hec_metrics" {
            for_each = destination.value.splunk_hec_metrics != null ? destination.value.splunk_hec_metrics : []
            content {
              dynamic "buffer" {
                for_each = splunk_hec_metrics.value.buffer != null ? splunk_hec_metrics.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              compression       = splunk_hec_metrics.value.compression
              default_namespace = splunk_hec_metrics.value.default_namespace
              endpoint_url_key  = splunk_hec_metrics.value.endpoint_url_key
              index             = splunk_hec_metrics.value.index
              source            = splunk_hec_metrics.value.source
              sourcetype        = splunk_hec_metrics.value.sourcetype
              dynamic "tls" {
                for_each = splunk_hec_metrics.value.tls != null ? splunk_hec_metrics.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              token_key = splunk_hec_metrics.value.token_key
            }
          }
          dynamic "sumo_logic" {
            for_each = destination.value.sumo_logic != null ? destination.value.sumo_logic : []
            content {
              dynamic "buffer" {
                for_each = sumo_logic.value.buffer != null ? sumo_logic.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              encoding         = sumo_logic.value.encoding
              endpoint_url_key = sumo_logic.value.endpoint_url_key
              dynamic "header_custom_field" {
                for_each = sumo_logic.value.header_custom_field != null ? sumo_logic.value.header_custom_field : []
                content {
                  name  = header_custom_field.value.name
                  value = header_custom_field.value.value
                }
              }
              header_host_name       = sumo_logic.value.header_host_name
              header_source_category = sumo_logic.value.header_source_category
              header_source_name     = sumo_logic.value.header_source_name
            }
          }
          dynamic "syslog_ng" {
            for_each = destination.value.syslog_ng != null ? destination.value.syslog_ng : []
            content {
              dynamic "buffer" {
                for_each = syslog_ng.value.buffer != null ? syslog_ng.value.buffer : []
                content {
                  dynamic "disk" {
                    for_each = buffer.value.disk != null ? buffer.value.disk : []
                    content {
                      max_size  = disk.value.max_size
                      when_full = disk.value.when_full
                    }
                  }
                  dynamic "memory" {
                    for_each = buffer.value.memory != null ? buffer.value.memory : []
                    content {
                      max_events = memory.value.max_events
                      max_size   = memory.value.max_size
                      when_full  = memory.value.when_full
                    }
                  }
                }
              }
              endpoint_url_key = syslog_ng.value.endpoint_url_key
              keepalive        = syslog_ng.value.keepalive
              dynamic "tls" {
                for_each = syslog_ng.value.tls != null ? syslog_ng.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
            }
          }
        }
      }
      pipeline_type = config.value.pipeline_type
      dynamic "processor_group" {
        for_each = config.value.processor_group != null ? config.value.processor_group : []
        content {
          display_name = processor_group.value.display_name
          enabled      = processor_group.value.enabled
          id           = processor_group.value.id
          include      = processor_group.value.include
          inputs       = processor_group.value.inputs
          dynamic "processor" {
            for_each = processor_group.value.processor != null ? processor_group.value.processor : []
            content {
              dynamic "add_env_vars" {
                for_each = processor.value.add_env_vars != null ? processor.value.add_env_vars : []
                content {
                  dynamic "variable" {
                    for_each = add_env_vars.value.variable != null ? add_env_vars.value.variable : []
                    content {
                      field = variable.value.field
                      name  = variable.value.name
                    }
                  }
                }
              }
              dynamic "add_fields" {
                for_each = processor.value.add_fields != null ? processor.value.add_fields : []
                content {
                  dynamic "field" {
                    for_each = add_fields.value.field != null ? add_fields.value.field : []
                    content {
                      name  = field.value.name
                      value = field.value.value
                    }
                  }
                }
              }
              dynamic "add_hostname" {
                for_each = processor.value.add_hostname != null ? processor.value.add_hostname : []
                content {
                }
              }
              dynamic "add_metric_tags" {
                for_each = processor.value.add_metric_tags != null ? processor.value.add_metric_tags : []
                content {
                  dynamic "tag" {
                    for_each = add_metric_tags.value.tag != null ? add_metric_tags.value.tag : []
                    content {
                      name  = tag.value.name
                      value = tag.value.value
                    }
                  }
                }
              }
              dynamic "aggregate" {
                for_each = processor.value.aggregate != null ? processor.value.aggregate : []
                content {
                  interval_secs = aggregate.value.interval_secs
                  mode          = aggregate.value.mode
                }
              }
              dynamic "custom_processor" {
                for_each = processor.value.custom_processor != null ? processor.value.custom_processor : []
                content {
                  dynamic "remap" {
                    for_each = custom_processor.value.remap != null ? custom_processor.value.remap : []
                    content {
                      drop_on_error = remap.value.drop_on_error
                      enabled       = remap.value.enabled
                      include       = remap.value.include
                      name          = remap.value.name
                      source        = remap.value.source
                    }
                  }
                }
              }
              dynamic "datadog_tags" {
                for_each = processor.value.datadog_tags != null ? processor.value.datadog_tags : []
                content {
                  action = datadog_tags.value.action
                  keys   = datadog_tags.value.keys
                  mode   = datadog_tags.value.mode
                }
              }
              dynamic "dedupe" {
                for_each = processor.value.dedupe != null ? processor.value.dedupe : []
                content {
                  fields = dedupe.value.fields
                  mode   = dedupe.value.mode
                }
              }
              display_name = processor.value.display_name
              enabled      = processor.value.enabled
              dynamic "enrichment_table" {
                for_each = processor.value.enrichment_table != null ? processor.value.enrichment_table : []
                content {
                  dynamic "file" {
                    for_each = enrichment_table.value.file != null ? enrichment_table.value.file : []
                    content {
                      dynamic "encoding" {
                        for_each = file.value.encoding != null ? file.value.encoding : []
                        content {
                          delimiter        = encoding.value.delimiter
                          includes_headers = encoding.value.includes_headers
                          type             = encoding.value.type
                        }
                      }
                      dynamic "key" {
                        for_each = file.value.key != null ? file.value.key : []
                        content {
                          column     = key.value.column
                          comparison = key.value.comparison
                          dynamic "field" {
                            for_each = key.value.field != null ? key.value.field : []
                            content {
                              event       = field.value.event
                              secret      = field.value.secret
                              string_path = field.value.string_path
                              vrl         = field.value.vrl
                            }
                          }
                        }
                      }
                      path = file.value.path
                    }
                  }
                  dynamic "geoip" {
                    for_each = enrichment_table.value.geoip != null ? enrichment_table.value.geoip : []
                    content {
                      key_field = geoip.value.key_field
                      locale    = geoip.value.locale
                      path      = geoip.value.path
                    }
                  }
                  dynamic "reference_table" {
                    for_each = enrichment_table.value.reference_table != null ? enrichment_table.value.reference_table : []
                    content {
                      app_key_key = reference_table.value.app_key_key
                      columns     = reference_table.value.columns
                      key_field   = reference_table.value.key_field
                      table_id    = reference_table.value.table_id
                    }
                  }
                  target = enrichment_table.value.target
                }
              }
              dynamic "filter" {
                for_each = processor.value.filter != null ? processor.value.filter : []
                content {
                }
              }
              dynamic "generate_datadog_metrics" {
                for_each = processor.value.generate_datadog_metrics != null ? processor.value.generate_datadog_metrics : []
                content {
                  dynamic "metric" {
                    for_each = generate_datadog_metrics.value.metric != null ? generate_datadog_metrics.value.metric : []
                    content {
                      group_by    = metric.value.group_by
                      include     = metric.value.include
                      metric_type = metric.value.metric_type
                      name        = metric.value.name
                      dynamic "value" {
                        for_each = metric.value.value != null ? metric.value.value : []
                        content {
                          field    = value.value.field
                          strategy = value.value.strategy
                        }
                      }
                    }
                  }
                }
              }
              dynamic "generate_metrics" {
                for_each = processor.value.generate_metrics != null ? processor.value.generate_metrics : []
                content {
                  dynamic "metric" {
                    for_each = generate_metrics.value.metric != null ? generate_metrics.value.metric : []
                    content {
                      group_by    = metric.value.group_by
                      include     = metric.value.include
                      metric_type = metric.value.metric_type
                      name        = metric.value.name
                      dynamic "value" {
                        for_each = metric.value.value != null ? metric.value.value : []
                        content {
                          field    = value.value.field
                          strategy = value.value.strategy
                        }
                      }
                    }
                  }
                }
              }
              id      = processor.value.id
              include = processor.value.include
              dynamic "metric_enrichment_table" {
                for_each = processor.value.metric_enrichment_table != null ? processor.value.metric_enrichment_table : []
                content {
                  dynamic "file" {
                    for_each = metric_enrichment_table.value.file != null ? metric_enrichment_table.value.file : []
                    content {
                      dynamic "encoding" {
                        for_each = file.value.encoding != null ? file.value.encoding : []
                        content {
                          delimiter        = encoding.value.delimiter
                          includes_headers = encoding.value.includes_headers
                          type             = encoding.value.type
                        }
                      }
                      dynamic "key" {
                        for_each = file.value.key != null ? file.value.key : []
                        content {
                          column = key.value.column
                          dynamic "source" {
                            for_each = key.value.source != null ? key.value.source : []
                            content {
                              name = source.value.name
                              type = source.value.type
                            }
                          }
                        }
                      }
                      path = file.value.path
                    }
                  }
                  dynamic "reference_table" {
                    for_each = metric_enrichment_table.value.reference_table != null ? metric_enrichment_table.value.reference_table : []
                    content {
                      app_key_key = reference_table.value.app_key_key
                      columns     = reference_table.value.columns
                      dynamic "key" {
                        for_each = reference_table.value.key != null ? reference_table.value.key : []
                        content {
                          dynamic "source" {
                            for_each = key.value.source != null ? key.value.source : []
                            content {
                              name = source.value.name
                              type = source.value.type
                            }
                          }
                        }
                      }
                      table_id = reference_table.value.table_id
                    }
                  }
                }
              }
              dynamic "metric_tags" {
                for_each = processor.value.metric_tags != null ? processor.value.metric_tags : []
                content {
                  dynamic "rule" {
                    for_each = metric_tags.value.rule != null ? metric_tags.value.rule : []
                    content {
                      action  = rule.value.action
                      include = rule.value.include
                      keys    = rule.value.keys
                      mode    = rule.value.mode
                    }
                  }
                }
              }
              dynamic "ocsf_mapper" {
                for_each = processor.value.ocsf_mapper != null ? processor.value.ocsf_mapper : []
                content {
                  keep_unmatched = ocsf_mapper.value.keep_unmatched
                  dynamic "mapping" {
                    for_each = ocsf_mapper.value.mapping != null ? ocsf_mapper.value.mapping : []
                    content {
                      dynamic "custom_mapping" {
                        for_each = mapping.value.custom_mapping != null ? mapping.value.custom_mapping : []
                        content {
                          dynamic "mapping" {
                            for_each = custom_mapping.value.mapping != null ? custom_mapping.value.mapping : []
                            content {
                              default = mapping.value.default
                              dest    = mapping.value.dest
                              dynamic "lookup" {
                                for_each = mapping.value.lookup != null ? mapping.value.lookup : []
                                content {
                                  default = lookup.value.default
                                  dynamic "table" {
                                    for_each = lookup.value.table != null ? lookup.value.table : []
                                    content {
                                      contains      = table.value.contains
                                      equals        = table.value.equals
                                      equals_source = table.value.equals_source
                                      matches       = table.value.matches
                                      not_matches   = table.value.not_matches
                                      value         = table.value.value
                                    }
                                  }
                                }
                              }
                              source  = mapping.value.source
                              sources = mapping.value.sources
                              value   = mapping.value.value
                            }
                          }
                          dynamic "metadata" {
                            for_each = custom_mapping.value.metadata != null ? custom_mapping.value.metadata : []
                            content {
                              class    = metadata.value.class
                              profiles = metadata.value.profiles
                              version  = metadata.value.version
                            }
                          }
                          version = custom_mapping.value.version
                        }
                      }
                      include         = mapping.value.include
                      library_mapping = mapping.value.library_mapping
                    }
                  }
                }
              }
              dynamic "parse_grok" {
                for_each = processor.value.parse_grok != null ? processor.value.parse_grok : []
                content {
                  disable_library_rules = parse_grok.value.disable_library_rules
                  field                 = parse_grok.value.field
                  dynamic "include_rule" {
                    for_each = parse_grok.value.include_rule != null ? parse_grok.value.include_rule : []
                    content {
                      include = include_rule.value.include
                      dynamic "match_rule" {
                        for_each = include_rule.value.match_rule != null ? include_rule.value.match_rule : []
                        content {
                          name = match_rule.value.name
                          rule = match_rule.value.rule
                        }
                      }
                      dynamic "support_rule" {
                        for_each = include_rule.value.support_rule != null ? include_rule.value.support_rule : []
                        content {
                          name = support_rule.value.name
                          rule = support_rule.value.rule
                        }
                      }
                    }
                  }
                  dynamic "rule" {
                    for_each = parse_grok.value.rule != null ? parse_grok.value.rule : []
                    content {
                      dynamic "match_rule" {
                        for_each = rule.value.match_rule != null ? rule.value.match_rule : []
                        content {
                          name = match_rule.value.name
                          rule = match_rule.value.rule
                        }
                      }
                      source = rule.value.source
                      dynamic "support_rule" {
                        for_each = rule.value.support_rule != null ? rule.value.support_rule : []
                        content {
                          name = support_rule.value.name
                          rule = support_rule.value.rule
                        }
                      }
                    }
                  }
                }
              }
              dynamic "parse_json" {
                for_each = processor.value.parse_json != null ? processor.value.parse_json : []
                content {
                  field = parse_json.value.field
                }
              }
              dynamic "parse_xml" {
                for_each = processor.value.parse_xml != null ? processor.value.parse_xml : []
                content {
                  always_use_text_key = parse_xml.value.always_use_text_key
                  attr_prefix         = parse_xml.value.attr_prefix
                  field               = parse_xml.value.field
                  include_attr        = parse_xml.value.include_attr
                  parse_bool          = parse_xml.value.parse_bool
                  parse_null          = parse_xml.value.parse_null
                  parse_number        = parse_xml.value.parse_number
                  text_key            = parse_xml.value.text_key
                }
              }
              dynamic "quota" {
                for_each = processor.value.quota != null ? processor.value.quota : []
                content {
                  drop_events                    = quota.value.drop_events
                  ignore_when_missing_partitions = quota.value.ignore_when_missing_partitions
                  dynamic "limit" {
                    for_each = quota.value.limit != null ? quota.value.limit : []
                    content {
                      enforce = limit.value.enforce
                      limit   = limit.value.limit
                    }
                  }
                  name            = quota.value.name
                  overflow_action = quota.value.overflow_action
                  dynamic "override" {
                    for_each = quota.value.override != null ? quota.value.override : []
                    content {
                      dynamic "field" {
                        for_each = override.value.field != null ? override.value.field : []
                        content {
                          name  = field.value.name
                          value = field.value.value
                        }
                      }
                      dynamic "limit" {
                        for_each = override.value.limit != null ? override.value.limit : []
                        content {
                          enforce = limit.value.enforce
                          limit   = limit.value.limit
                        }
                      }
                    }
                  }
                  partition_fields        = quota.value.partition_fields
                  too_many_buckets_action = quota.value.too_many_buckets_action
                }
              }
              dynamic "reduce" {
                for_each = processor.value.reduce != null ? processor.value.reduce : []
                content {
                  group_by = reduce.value.group_by
                  dynamic "merge_strategy" {
                    for_each = reduce.value.merge_strategy != null ? reduce.value.merge_strategy : []
                    content {
                      path     = merge_strategy.value.path
                      strategy = merge_strategy.value.strategy
                    }
                  }
                }
              }
              dynamic "remove_fields" {
                for_each = processor.value.remove_fields != null ? processor.value.remove_fields : []
                content {
                  fields = remove_fields.value.fields
                }
              }
              dynamic "rename_fields" {
                for_each = processor.value.rename_fields != null ? processor.value.rename_fields : []
                content {
                  dynamic "field" {
                    for_each = rename_fields.value.field != null ? rename_fields.value.field : []
                    content {
                      destination     = field.value.destination
                      preserve_source = field.value.preserve_source
                      source          = field.value.source
                    }
                  }
                }
              }
              dynamic "rename_metric_tags" {
                for_each = processor.value.rename_metric_tags != null ? processor.value.rename_metric_tags : []
                content {
                  dynamic "tag" {
                    for_each = rename_metric_tags.value.tag != null ? rename_metric_tags.value.tag : []
                    content {
                      rename_to = tag.value.rename_to
                      tag       = tag.value.tag
                    }
                  }
                }
              }
              dynamic "sample" {
                for_each = processor.value.sample != null ? processor.value.sample : []
                content {
                  group_by   = sample.value.group_by
                  percentage = sample.value.percentage
                }
              }
              dynamic "sensitive_data_scanner" {
                for_each = processor.value.sensitive_data_scanner != null ? processor.value.sensitive_data_scanner : []
                content {
                  dynamic "rule" {
                    for_each = sensitive_data_scanner.value.rule != null ? sensitive_data_scanner.value.rule : []
                    content {
                      dynamic "keyword_options" {
                        for_each = rule.value.keyword_options != null ? rule.value.keyword_options : []
                        content {
                          keywords  = keyword_options.value.keywords
                          proximity = keyword_options.value.proximity
                        }
                      }
                      name = rule.value.name
                      dynamic "on_match" {
                        for_each = rule.value.on_match != null ? rule.value.on_match : []
                        content {
                          dynamic "hash" {
                            for_each = on_match.value.hash != null ? on_match.value.hash : []
                            content {
                            }
                          }
                          dynamic "partial_redact" {
                            for_each = on_match.value.partial_redact != null ? on_match.value.partial_redact : []
                            content {
                              characters = partial_redact.value.characters
                              direction  = partial_redact.value.direction
                            }
                          }
                          dynamic "redact" {
                            for_each = on_match.value.redact != null ? on_match.value.redact : []
                            content {
                              replace = redact.value.replace
                            }
                          }
                        }
                      }
                      dynamic "pattern" {
                        for_each = rule.value.pattern != null ? rule.value.pattern : []
                        content {
                          dynamic "custom" {
                            for_each = pattern.value.custom != null ? pattern.value.custom : []
                            content {
                              description = custom.value.description
                              rule        = custom.value.rule
                            }
                          }
                          dynamic "library" {
                            for_each = pattern.value.library != null ? pattern.value.library : []
                            content {
                              description              = library.value.description
                              id                       = library.value.id
                              use_recommended_keywords = library.value.use_recommended_keywords
                            }
                          }
                        }
                      }
                      dynamic "scope" {
                        for_each = rule.value.scope != null ? rule.value.scope : []
                        content {
                          all = scope.value.all
                          dynamic "exclude" {
                            for_each = scope.value.exclude != null ? scope.value.exclude : []
                            content {
                              fields = exclude.value.fields
                            }
                          }
                          dynamic "include" {
                            for_each = scope.value.include != null ? scope.value.include : []
                            content {
                              fields = include.value.fields
                            }
                          }
                        }
                      }
                      tags = rule.value.tags
                    }
                  }
                }
              }
              dynamic "split_array" {
                for_each = processor.value.split_array != null ? processor.value.split_array : []
                content {
                  dynamic "array" {
                    for_each = split_array.value.array != null ? split_array.value.array : []
                    content {
                      field   = array.value.field
                      include = array.value.include
                    }
                  }
                }
              }
              dynamic "tag_cardinality_limit" {
                for_each = processor.value.tag_cardinality_limit != null ? processor.value.tag_cardinality_limit : []
                content {
                  limit_exceeded_action = tag_cardinality_limit.value.limit_exceeded_action
                  dynamic "per_metric_limit" {
                    for_each = tag_cardinality_limit.value.per_metric_limit != null ? tag_cardinality_limit.value.per_metric_limit : []
                    content {
                      limit_exceeded_action = per_metric_limit.value.limit_exceeded_action
                      metric_name           = per_metric_limit.value.metric_name
                      override_type         = per_metric_limit.value.override_type
                      dynamic "per_tag_limit" {
                        for_each = per_metric_limit.value.per_tag_limit != null ? per_metric_limit.value.per_tag_limit : []
                        content {
                          override_type = per_tag_limit.value.override_type
                          tag_key       = per_tag_limit.value.tag_key
                          value_limit   = per_tag_limit.value.value_limit
                        }
                      }
                      value_limit = per_metric_limit.value.value_limit
                    }
                  }
                  dynamic "tracking_mode" {
                    for_each = tag_cardinality_limit.value.tracking_mode != null ? tag_cardinality_limit.value.tracking_mode : []
                    content {
                      mode = tracking_mode.value.mode
                    }
                  }
                  value_limit = tag_cardinality_limit.value.value_limit
                }
              }
              dynamic "throttle" {
                for_each = processor.value.throttle != null ? processor.value.throttle : []
                content {
                  group_by  = throttle.value.group_by
                  threshold = throttle.value.threshold
                  window    = throttle.value.window
                }
              }
            }
          }
        }
      }
      dynamic "source" {
        for_each = config.value.source != null ? config.value.source : []
        content {
          dynamic "amazon_data_firehose" {
            for_each = source.value.amazon_data_firehose != null ? source.value.amazon_data_firehose : []
            content {
              address_key = amazon_data_firehose.value.address_key
              dynamic "auth" {
                for_each = amazon_data_firehose.value.auth != null ? amazon_data_firehose.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                }
              }
              dynamic "tls" {
                for_each = amazon_data_firehose.value.tls != null ? amazon_data_firehose.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "amazon_s3" {
            for_each = source.value.amazon_s3 != null ? source.value.amazon_s3 : []
            content {
              dynamic "auth" {
                for_each = amazon_s3.value.auth != null ? amazon_s3.value.auth : []
                content {
                  assume_role  = auth.value.assume_role
                  external_id  = auth.value.external_id
                  session_name = auth.value.session_name
                }
              }
              compression = amazon_s3.value.compression
              region      = amazon_s3.value.region
              dynamic "tls" {
                for_each = amazon_s3.value.tls != null ? amazon_s3.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              url_key = amazon_s3.value.url_key
            }
          }
          dynamic "datadog_agent" {
            for_each = source.value.datadog_agent != null ? source.value.datadog_agent : []
            content {
              address_key = datadog_agent.value.address_key
              dynamic "tls" {
                for_each = datadog_agent.value.tls != null ? datadog_agent.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "fluent_bit" {
            for_each = source.value.fluent_bit != null ? source.value.fluent_bit : []
            content {
              address_key = fluent_bit.value.address_key
              dynamic "tls" {
                for_each = fluent_bit.value.tls != null ? fluent_bit.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "fluentd" {
            for_each = source.value.fluentd != null ? source.value.fluentd : []
            content {
              address_key = fluentd.value.address_key
              dynamic "tls" {
                for_each = fluentd.value.tls != null ? fluentd.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "google_pubsub" {
            for_each = source.value.google_pubsub != null ? source.value.google_pubsub : []
            content {
              dynamic "auth" {
                for_each = google_pubsub.value.auth != null ? google_pubsub.value.auth : []
                content {
                  credentials_file = auth.value.credentials_file
                }
              }
              decoding     = google_pubsub.value.decoding
              project      = google_pubsub.value.project
              subscription = google_pubsub.value.subscription
              dynamic "tls" {
                for_each = google_pubsub.value.tls != null ? google_pubsub.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
            }
          }
          dynamic "http_client" {
            for_each = source.value.http_client != null ? source.value.http_client : []
            content {
              auth_strategy        = http_client.value.auth_strategy
              custom_key           = http_client.value.custom_key
              decoding             = http_client.value.decoding
              endpoint_url_key     = http_client.value.endpoint_url_key
              password_key         = http_client.value.password_key
              scrape_interval_secs = http_client.value.scrape_interval_secs
              scrape_timeout_secs  = http_client.value.scrape_timeout_secs
              dynamic "tls" {
                for_each = http_client.value.tls != null ? http_client.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  server_name  = tls.value.server_name
                }
              }
              token_key    = http_client.value.token_key
              username_key = http_client.value.username_key
            }
          }
          dynamic "http_server" {
            for_each = source.value.http_server != null ? source.value.http_server : []
            content {
              address_key   = http_server.value.address_key
              auth_strategy = http_server.value.auth_strategy
              decoding      = http_server.value.decoding
              password_key  = http_server.value.password_key
              dynamic "tls" {
                for_each = http_server.value.tls != null ? http_server.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
              username_key = http_server.value.username_key
              dynamic "valid_token" {
                for_each = http_server.value.valid_token != null ? http_server.value.valid_token : []
                content {
                  enabled = valid_token.value.enabled
                  dynamic "field_to_add" {
                    for_each = valid_token.value.field_to_add != null ? valid_token.value.field_to_add : []
                    content {
                      key   = field_to_add.value.key
                      value = field_to_add.value.value
                    }
                  }
                  dynamic "path_to_token" {
                    for_each = valid_token.value.path_to_token != null ? valid_token.value.path_to_token : []
                    content {
                      header   = path_to_token.value.header
                      location = path_to_token.value.location
                    }
                  }
                  token_key = valid_token.value.token_key
                }
              }
            }
          }
          id = source.value.id
          dynamic "kafka" {
            for_each = source.value.kafka != null ? source.value.kafka : []
            content {
              bootstrap_servers_key = kafka.value.bootstrap_servers_key
              group_id              = kafka.value.group_id
              dynamic "librdkafka_option" {
                for_each = kafka.value.librdkafka_option != null ? kafka.value.librdkafka_option : []
                content {
                  name  = librdkafka_option.value.name
                  value = librdkafka_option.value.value
                }
              }
              dynamic "sasl" {
                for_each = kafka.value.sasl != null ? kafka.value.sasl : []
                content {
                  mechanism    = sasl.value.mechanism
                  password_key = sasl.value.password_key
                  username_key = sasl.value.username_key
                }
              }
              dynamic "tls" {
                for_each = kafka.value.tls != null ? kafka.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                }
              }
              topics = kafka.value.topics
            }
          }
          dynamic "logstash" {
            for_each = source.value.logstash != null ? source.value.logstash : []
            content {
              address_key = logstash.value.address_key
              dynamic "tls" {
                for_each = logstash.value.tls != null ? logstash.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "opentelemetry" {
            for_each = source.value.opentelemetry != null ? source.value.opentelemetry : []
            content {
              grpc_address_key = opentelemetry.value.grpc_address_key
              http_address_key = opentelemetry.value.http_address_key
              dynamic "tls" {
                for_each = opentelemetry.value.tls != null ? opentelemetry.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "prometheus_remote_write" {
            for_each = source.value.prometheus_remote_write != null ? source.value.prometheus_remote_write : []
            content {
              address_key   = prometheus_remote_write.value.address_key
              auth_strategy = prometheus_remote_write.value.auth_strategy
              password_key  = prometheus_remote_write.value.password_key
              path          = prometheus_remote_write.value.path
              dynamic "tls" {
                for_each = prometheus_remote_write.value.tls != null ? prometheus_remote_write.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
              username_key = prometheus_remote_write.value.username_key
              dynamic "valid_token" {
                for_each = prometheus_remote_write.value.valid_token != null ? prometheus_remote_write.value.valid_token : []
                content {
                  enabled = valid_token.value.enabled
                  dynamic "path_to_token" {
                    for_each = valid_token.value.path_to_token != null ? valid_token.value.path_to_token : []
                    content {
                      header   = path_to_token.value.header
                      location = path_to_token.value.location
                    }
                  }
                  token_key = valid_token.value.token_key
                }
              }
            }
          }
          dynamic "rsyslog" {
            for_each = source.value.rsyslog != null ? source.value.rsyslog : []
            content {
              address_key = rsyslog.value.address_key
              mode        = rsyslog.value.mode
              dynamic "tls" {
                for_each = rsyslog.value.tls != null ? rsyslog.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "socket" {
            for_each = source.value.socket != null ? source.value.socket : []
            content {
              address_key = socket.value.address_key
              dynamic "framing" {
                for_each = socket.value.framing != null ? socket.value.framing : []
                content {
                  dynamic "character_delimited" {
                    for_each = framing.value.character_delimited != null ? framing.value.character_delimited : []
                    content {
                      delimiter = character_delimited.value.delimiter
                    }
                  }
                  method = framing.value.method
                }
              }
              mode = socket.value.mode
              dynamic "tls" {
                for_each = socket.value.tls != null ? socket.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "splunk_hec" {
            for_each = source.value.splunk_hec != null ? source.value.splunk_hec : []
            content {
              address_key     = splunk_hec.value.address_key
              store_hec_token = splunk_hec.value.store_hec_token
              dynamic "tls" {
                for_each = splunk_hec.value.tls != null ? splunk_hec.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
              dynamic "valid_token" {
                for_each = splunk_hec.value.valid_token != null ? splunk_hec.value.valid_token : []
                content {
                  enabled = valid_token.value.enabled
                  dynamic "field_to_add" {
                    for_each = valid_token.value.field_to_add != null ? valid_token.value.field_to_add : []
                    content {
                      key   = field_to_add.value.key
                      value = field_to_add.value.value
                    }
                  }
                  token_key = valid_token.value.token_key
                }
              }
            }
          }
          dynamic "splunk_tcp" {
            for_each = source.value.splunk_tcp != null ? source.value.splunk_tcp : []
            content {
              address_key                  = splunk_tcp.value.address_key
              max_connection_duration_secs = splunk_tcp.value.max_connection_duration_secs
              dynamic "tls" {
                for_each = splunk_tcp.value.tls != null ? splunk_tcp.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "sumo_logic" {
            for_each = source.value.sumo_logic != null ? source.value.sumo_logic : []
            content {
              address_key = sumo_logic.value.address_key
            }
          }
          dynamic "syslog_ng" {
            for_each = source.value.syslog_ng != null ? source.value.syslog_ng : []
            content {
              address_key = syslog_ng.value.address_key
              mode        = syslog_ng.value.mode
              dynamic "tls" {
                for_each = syslog_ng.value.tls != null ? syslog_ng.value.tls : []
                content {
                  ca_file            = tls.value.ca_file
                  crt_file           = tls.value.crt_file
                  key_file           = tls.value.key_file
                  key_pass_key       = tls.value.key_pass_key
                  verify_certificate = tls.value.verify_certificate
                }
              }
            }
          }
          dynamic "websocket" {
            for_each = source.value.websocket != null ? source.value.websocket : []
            content {
              auth_strategy = websocket.value.auth_strategy
              custom_key    = websocket.value.custom_key
              decoding      = websocket.value.decoding
              password_key  = websocket.value.password_key
              dynamic "tls" {
                for_each = websocket.value.tls != null ? websocket.value.tls : []
                content {
                  ca_file      = tls.value.ca_file
                  crt_file     = tls.value.crt_file
                  key_file     = tls.value.key_file
                  key_pass_key = tls.value.key_pass_key
                  mode         = tls.value.mode
                }
              }
              token_key    = websocket.value.token_key
              uri_key      = websocket.value.uri_key
              username_key = websocket.value.username_key
            }
          }
        }
      }
      use_legacy_search_syntax = config.value.use_legacy_search_syntax
    }
  }
}

