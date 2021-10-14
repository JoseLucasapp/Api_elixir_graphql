defmodule CodigoFont.Repo do
  use Ecto.Repo,
    otp_app: :codigo_font,
    adapter: Ecto.Adapters.Postgres
end
