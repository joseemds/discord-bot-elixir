defmodule BotExample.Command.Docs do
  def get_docs(module_name) do
    {:docs_v1, _, :elixir, _, %{"en" => module_doc}, _, _} =
      Code.fetch_docs(Module.concat("Elixir", String.capitalize(module_name)))

    module_doc
  end
end
