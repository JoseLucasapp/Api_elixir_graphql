defmodule CodigoFont.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CodigoFont.Repo,
      # Start the Telemetry supervisor
      CodigoFontWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CodigoFont.PubSub},
      # Start the Endpoint (http/https)
      CodigoFontWeb.Endpoint
      # Start a worker by calling: CodigoFont.Worker.start_link(arg)
      # {CodigoFont.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CodigoFont.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CodigoFontWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
