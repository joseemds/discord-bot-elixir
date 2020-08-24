defmodule BotExampleTest do
  use ExUnit.Case
  doctest BotExample

  test "greets the world" do
    assert BotExample.hello() == :world
  end
end
