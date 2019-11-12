use Mix.Config

# Configure your database
config :viewer_api, ViewerApi.Repo,
  username: "root",
  password: "",
  database: "viewer_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :viewer_api, ViewerApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
