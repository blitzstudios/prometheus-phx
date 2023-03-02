defmodule PrometheusPhx.Config do

  require Prometheus.Contrib.HTTP

  def controller_call_labels do
    Application.get_env(:prometheus_phx, :controller_call_labels, [:action, :controller, :status])
  end

  def error_rendered_labels do
    Application.get_env(:prometheus_phx, :error_rendered_labels, [:action, :controller, :status])
  end

  def channel_join_labels do
    Application.get_env(:prometheus_phx, :channel_join_labels, [:channel, :topic, :transport])
  end

  def channel_receive_labels do
    Application.get_env(:prometheus_phx, :channel_receive_labels, [:channel, :topic, :transport, :event])
  end

  def duration_buckets do
    Application.get_env(:prometheus_phx, :duration_buckets, Prometheus.Contrib.HTTP.microseconds_duration_buckets())
  end

  def duration_unit do
    Application.get_env(:prometheus_phx, :duration_unit, :microseconds)
  end
end
