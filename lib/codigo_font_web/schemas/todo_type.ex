defmodule CodigoFontWeb.Schema.Types.Todotype do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: CodigoFont.Repo

  object :todo_type do
    field(:id, :id)
    field(:title, :string)
    field(:desc, non_null(:string))
    field(:user, :user_type, resolve: assoc(:user))
  end

  input_object :todo_input_type do
    field(:title, non_null(:string))
    field(:desc, non_null(:string))
  end
end
