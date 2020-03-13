defmodule PhxLv2.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_lv_2,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhxLv2.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # {:phoenix, "~> 1.4.0", override: true},
      {:phoenix, github: "phoenixframework/phoenix", override: true},
      # {:phoenix_pubsub, "~> 2.0"},
      # {:phoenix, "~> 1.4.15", [env: :prod, git: "https://github.com/phoenixframework/phoenix.git", branch: "v1.4"]},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      # {:phoenix_live_view, "~> 0.8.0"},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"}
    ]
  end
end
