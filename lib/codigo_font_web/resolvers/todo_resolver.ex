defmodule CodigoFontWeb.Resolvers.TodoResolver do
  alias CodigoFont.Todos

  def create_todo(_, %{input: input}, %{context: %{current_user: current_user}}) do
    todo_input = Map.merge(input, %{user_id: current_user.id})
    Todos.create_todo(todo_input)
  end

  def get_todos(_, _, %{context: %{current_user: current_user}}) do
    {:ok, Todos.list_todos()}
  end

  def delete(%{id: id}, _info) do
    with {:ok, post} <- Todos.delete(id) do
      {:ok, post}
    else
      {:error, _} -> {:error, "Failed to delete todo"}
    end
  end
end
