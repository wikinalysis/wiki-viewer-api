import Config

config :viewer_api, ViewerApi.Repo,
  ssl: true,
  username: "root",
  password: "6,VG_(eqqd}2JIRU(~uc",
  database: "wikidata",
  socket: "/tmp/cloudsql/" <> "coastal-range-256000:us-central1:wikidata-main",
  pool_size: 10

secret_key_base =
  System.fetch_env!("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :hello, HelloWeb.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  check_origin: false,
  server: true,
  root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json"
