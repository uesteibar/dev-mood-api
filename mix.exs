defmodule TwitterDevMood.Mixfile do
  use Mix.Project

  def project do
    [app: :twitter_dev_mood,
     version: "1.0.0",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      extra_applications: app_list(Mix.env),
      mod: {TwitterDevMood, []},
    ]
  end


  defp app_list(:dev), do: [:dotenv | app_list()]
  defp app_list(_), do: app_list()
  defp app_list, do:  [
    :poison,
    :phoenix,
    :phoenix_pubsub,
    :phoenix_html,
    :cowboy,
    :logger,
    :gettext,
    :phoenix_ecto,
    :postgrex,
    :extwitter,
    :quantum,
  ]

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:exrm, "~> 1.0.8" },
      {:phoenix, "~> 1.2.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:extwitter, "~> 0.8.3"},
      {:oauth, github: "tim/erlang-oauth"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:dotenv, "~> 2.0.0"},
      {:veritaserum, "~> 0.1.1"},
      {:quantum, "~> 1.9"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"],
    ]
  end
end
