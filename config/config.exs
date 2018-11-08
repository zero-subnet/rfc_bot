# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rfc_bot,
  ecto_repos: [RfcBot.Repo]

# Configures the endpoint
config :rfc_bot, RfcBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Oa65Rv3cyqz9JKkH6SbT7tfkPlRPT0iWQ04qo3ts8V+elBRuuGaOFf870ERiJrRE",
  render_errors: [view: RfcBotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RfcBot.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
