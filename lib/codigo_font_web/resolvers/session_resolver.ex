defmodule CodigoFontWeb.Resolvers.SessionResolver do
  alias CodigoFont.Accounts

  def login_users(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.Session.authenticate(input),
         {:ok, jwt_token, _} <- CodigoFont.Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
