import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :codigo_font, CodigoFont.Repo,
  username: System.get_env("DATABASE_USER"),
  password: System.get_env("DATABASE_PASS"),
  database: System.get_env("DATABASE_NAME"),
  hostname: System.get_env("DATABASE_HOST"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "2"),
  database_url: System.get_env("DATABASE_URL"),
  ownership_timeout: 100_000,
  pool: Ecto.Adapters.SQL.Sandbox,
  show_sensitive_data_on_connection_error: true,
  adapter: Ecto.Adapters.Postgres,
  migration_timestamps: [type: :utc_datetime_usec],
  migration_lock: nil,
  queue_target: 1000

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :codigo_font, CodigoFontWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: false

# In test we don't send emails.
config :codigo_font, CodigoFont.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
