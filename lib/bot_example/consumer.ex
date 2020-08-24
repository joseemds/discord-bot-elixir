defmodule BotExample.Consumer do
  require Logger
  use Nostrum.Consumer

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}) do
  end

  def handle_event(_event) do
    Logger.log(:ok, "Nothing happened")
  end
end
