defmodule CodigoFontWeb.Schema do
  use Absinthe.Schema

  alias CodigoFontWeb.Resolvers
  alias CodigoFontWeb.Schemas.Middlewares
  import_types(CodigoFontWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      # Resolver
      middleware(Middlewares.Authorization, "admin")
      resolve(&Resolvers.UserResolver.users/3)
    end

    @desc "Get user todos"
    field :get_todos, list_of(:todo_type) do
      middleware(Middlewares.Authorization, :any)
      resolve(&Resolvers.TodoResolver.get_todos/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Login a user and return jwt token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_users/3)
    end

    @desc "Create a todo"
    field :create_todo, type: :todo_type do
      arg(:input, non_null(:todo_input_type))
      middleware(Middlewares.Authorization, :any)
      resolve(&Resolvers.TodoResolver.create_todo/3)
    end

    @desc "Delete a todo"
    field :delete_todo, type: :todo_type do
      arg(:id, non_null(:id))
      middleware(Middlewares.Authorization, :any)
      resolve(&Resolvers.TodoResolver.delete/2)
    end
  end

  #subscription do
  #end

end
