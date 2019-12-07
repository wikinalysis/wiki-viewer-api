import Config

config :viewer_api, ViewerApi.Repo,
  ssl: true,
  username: System.fetch_env!("DB_USERNAME"),
  password: System.fetch_env!("DB_PASSWORD"),
  database: System.fetch_env!("DB_DATABASE"),
  socket: "/cloud/" <> System.fetch_env!("INSTANCE_CONNECTION_NAME"),
  pool_size: String.to_integer(System.fetch_env("POOL_SIZE") || "10")

secret_key_base =
  System.fetch_env!("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :viewer_api, ViewerApiWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.fetch_env!("PORT"))],
  secret_key_base: secret_key_base
