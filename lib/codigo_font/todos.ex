defmodule CodigoFont.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias CodigoFont.Repo

  alias CodigoFont.Todos.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos(user) do
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM todos WHERE user_id = $1", [user])
    Enum.map(result.rows, &Repo.load(Todo, {result.columns, &1}))
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete(id, user_id) do
    {id_new, _} = Integer.parse(id)
    Ecto.Adapters.SQL.query!(Repo, "DELETE FROM todos WHERE id = $1 and user_id = $2", [id_new, user_id])
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM todos WHERE user_id = $1", [user_id])
    Enum.map(result.rows, &Repo.load(Todo, {result.columns, &1}))
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end
end
