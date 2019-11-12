# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :viewer_api,
  ecto_repos: [ViewerApi.Repo]

# Configures the endpoint
config :viewer_api, ViewerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PoSnmwiP7FmVNSgTQ1KUTxh0g18f6NmCzi15vvffQc3PFh89Ti5djE+E5Jd9I0hU",
  render_errors: [view: ViewerApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ViewerApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
