defmodule BotExample.Command do
  @prefix "e"
  @bot_id 731_905_838_217_822_250

  def handle(%{author: %{id: @bot_id}}), do: :noop

  def handle(msg = %{content: @prefix <> content}) do
    content
    |> String.trim()
    |> String.split(" ", parts: 3)
    |> execute(msg)
  end

  def handle(_), do: :noop

  defp execute(["ping"], msg) do
    Nostrum.Api.create_message(msg.channel_id, "pong")
  end

  defp execute(_, msg) do
    Nostrum.Api.create_message(msg.channel_id, "This command doesnt exist, sorry")
  end
end
