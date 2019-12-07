import Config

config :viewer_api, ViewerApi.Repo,
  ssl: true,
  username: "root",
  password: "6,VG_(eqqd}2JIRU(~uc",
  database: "wikidata",
  socket: "/tmp/cloudsql/" <> "coastal-range-256000:us-central1:wikidata-main",
  pool_size: 15

secret_key_base = "guXa9fvX2y/pwTsuTGjEe47x5Cqj6TUEqtJTLU0TPfPd9fgb+92kKVOwNNZyo+gf"

config :viewer_api, ViewerApiWeb.Endpoint, secret_key_base: secret_key_base
