defmodule BotExample.Command do
  @prefix "?"

  defp is_actionable?(command), do: String.starts_with?(@prefix, command.content)

  def handle(command) do
    if is_actionable?(command) do
      command.content
      |> String.trim()
      |> String.split(" ", parts: 3)
      |> Kernel.tl()
      |> execute(command)
    end
  end

  defp execute(args, command) do
    {:ok, args, command}
  end
end
