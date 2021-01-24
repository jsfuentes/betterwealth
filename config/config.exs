# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :betterwealth, Betterwealth.Repo,
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_DATABASE"),
  hostname: System.get_env("DB_HOSTNAME"),
  show_sensitive_data_on_connection_error: true,
  migration_timestamps: [type: :utc_datetime_usec],
  pool_size: 5,
  ssl: true,
  ssl_opts: [
    versions: [:"tlsv1.2"]
  ]

config :betterwealth,
  ecto_repos: [Betterwealth.Repo]

# Configures the endpoint
config :betterwealth, BetterwealthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cbsOg+p/PH5c32OYhXgVqa70WQ15NXEhyy7e3SOU2L3vT/hE1dCIQTcfK7k1ZCNt",
  render_errors: [view: BetterwealthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Betterwealth.PubSub,
  live_view: [signing_salt: "h9yIR9fN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
