defmodule CodigoFontWeb.Schema.Types.Usertype do
  use Absinthe.Schema.Notation

  object :user_type do
    field(:id, :id)
    field(:email, :string)
    field(:password_hash, :string)
    field(:username, :string)
    field(:role, :string)
  end

  input_object :user_input_type do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:username, non_null(:string))
    field(:role, non_null(:string))
  end
end
