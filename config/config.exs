# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :codigo_font,
  ecto_repos: [CodigoFont.Repo]

# Configures the endpoint
config :codigo_font, CodigoFontWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: CodigoFontWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CodigoFont.PubSub,
  live_view: [signing_salt: "kR/1SNo9"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :codigo_font, CodigoFont.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian config details
config :codigofont_graphql_api, CodigoFont.Guardian,
  issuer: "codigofont_graphql_api",
  secret_key: "EfBWqET1UX8eIlK5AflECIHmqFkzL309djJR+bkdutpcN4Mf9pEyz507zpVCsz03"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

import_config "#{Mix.env()}.exs"
