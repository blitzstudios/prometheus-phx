# PrometheusPhx

A Phoenix 1.5+ telemetry handler for Prometheus

## Getting Started

You can add PrometheusPhx as a dependency in your `mix.exs` file. In Phoenix 1.5 the telemetry instrumentation was changed and events have to be handled. This prevents libraries like `prometheus-phoenix` from working with newer versions of phoenix. So there are some minimum requirements. PrometheusPhx does require Elixir 1.7 or greater and Phoenix 1.5 or greater. 

```elixir
def deps do
  [ { :prometheus_phx, github: "theblitzapp/prometheus-phx" } ]
end
```

After running `mix deps.get` you can add the prometheus-phx setup call to your application module.

```
defmodule MyPhoenixApp.Application do
  use Application

  def start(_type, _args) do
    children = [
      MyPhoenixApp.Endpoint.
      ...
    ]

    PrometheusPhx.setup()

    Supervisor.start_link(children, [])
  end
end

```

You also need to wire up Plug.Telemetry in your endpoint
```
Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
```

Example configuration
```
config :prometheus_phx,
    duration_unit: :microseconds,
    duration_buckets: Prometheus.Contrib.HTTP.microseconds_duration_buckets(),
    controller_call_labels: [:action, :controller, :status],
    error_rendered_labels: [:action, :controller, :status],
    channel_join_labels: [:channel, :topic, :transport],
    channel_receive_labels: [:channel, :topic, :transport, :event],
    registry: :default
```    