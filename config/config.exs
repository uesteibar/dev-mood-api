# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitter_dev_mood,
  ecto_repos: [TwitterDevMood.Repo]

# Configures the endpoint
config :twitter_dev_mood, TwitterDevMood.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tMVA1wVSWVJLJxC+fURbHAehx2fkMk92jlA8iKDUFe3YjC59H0Me5umMmNMhXN8Y",
  render_errors: [view: TwitterDevMood.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwitterDevMood.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
