defmodule CodigoFont.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodigoFont.Accounts.User

  schema "todos" do
    field :title, :string
    field :desc, :string
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :desc, :user_id])
    |> validate_required([:title, :desc, :user_id])
    |> validate_length(:title, min: 5, max: 99)
    |> validate_length(:desc, min: 5, max: 99)
  end
end
