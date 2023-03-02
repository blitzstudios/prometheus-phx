use Mix.Config

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Example config
# config :prometheus_phx,
#     duration_unit: :microseconds,
#     duration_buckets: Prometheus.Contrib.HTTP.microseconds_duration_buckets(),
#     controller_call_labels: [:action, :controller, :status],
#     error_rendered_labels: [:action, :controller, :status],
#     channel_join_labels: [:channel, :topic, :transport],
#     channel_receive_labels: [:channel, :topic, :transport, :event],
#     registry: :default

import_config "#{Mix.env()}.exs"
