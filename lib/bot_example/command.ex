defmodule BotExample.Command do
  @prefix "e"
  @bot_id 731_905_838_217_822_250

  defguardp is_bot_author?(author_id) when author_id == @bot_id

  def handle(%{author: %{id: id}}) when is_bot_author?(id), do: :noop

  def handle(msg) do
    @prefix <> content = msg.content

    content
    |> String.trim()
    |> String.split(" ", parts: 3)
    |> execute(msg)
  end

  defp execute(["ping"], msg) do
    Nostrum.Api.create_message(msg.channel_id, "pong")
  end

  defp execute(_, msg) do
    Nostrum.Api.create_message(msg.channel_id, "Invalid command repeat it please")
  end
end
