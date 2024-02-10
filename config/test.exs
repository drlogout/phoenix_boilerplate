import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_boilerplate, PhoenixBoilerplate.Repo,
  database: Path.expand("../phoenix_boilerplate_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_boilerplate, PhoenixBoilerplateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3lfvkgNemwVo/vrTm82Q2/1Ztge0DLmcp4ZaIKpvLQ20bZnvPUmnH6Hs4UC+Kf4R",
  server: false

# In test we don't send emails.
config :phoenix_boilerplate, PhoenixBoilerplate.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
