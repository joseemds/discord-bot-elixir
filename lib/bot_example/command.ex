defmodule BotExample.Command do
  alias BotExample.Command
  @prefix "e"
  @bot_id 747_816_914_826_297_394

  def handle(%{author: %{id: @bot_id}}), do: :noop

  def handle(msg = %{content: @prefix <> content}) do
    content
    |> String.trim()
    |> String.split(" ", parts: 3)
    |> execute(msg)
  end

  def handle(_), do: :noop

  defp execute(["ping"], msg) do
    create_message(msg.channel_id, "pong")
  end

  defp execute(["docs", module_name], msg) do
    doc = Command.Docs.get_docs(module_name)
    create_message(msg.channel_id, doc)
  end

  defp execute(_, msg) do
    create_message(msg.channel_id, "This command doesnt exist, sorry")
  end

  defp create_message(channel_id, message) do
    Nostrum.Api.create_message(channel_id, message)
  end
end
