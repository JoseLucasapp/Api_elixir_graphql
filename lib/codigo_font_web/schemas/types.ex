defmodule CodigoFontWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias CodigoFontWeb.Schema.Types

  import_types(Types.Usertype)
  import_types(Types.Sessiontype)
  import_types(Types.Todotype)
end
