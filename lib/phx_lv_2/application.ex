defmodule PhxLv2.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, [name: PhxLv2.PubSub, adapter: Phoenix.PubSub.PG2]},
      PhxLv2Web.Endpoint,
    ]

    opts = [strategy: :one_for_one, name: PhxLv2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PhxLv2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
