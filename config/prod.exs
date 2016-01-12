use Mix.Config

config :care_cost_manager, CareCostManager.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "carecostmanager.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")
# Do not print debug messages in production
config :logger, level: :info

config :care_cost_manager, CareCostManager.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20
