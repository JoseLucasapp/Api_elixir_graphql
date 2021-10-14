import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :codigo_font, CodigoFont.Repo,
  username: "postgres",
  password: "1234",
  database: "todo",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :codigo_font, CodigoFontWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "XivgfS62Xu6U28xZjF47KCVIRBqPTU0hmO3TmAUHyaUz94BEAbXoBrfLAO5s2bPg",
  server: false

# In test we don't send emails.
config :codigo_font, CodigoFont.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
