defmodule CodigoFont.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CodigoFont.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        title: "some title"
      })
      |> CodigoFont.Todos.create_todo()

    todo
  end
end
