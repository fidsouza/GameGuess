defmodule GameguesseTest do
  use ExUnit.Case
  doctest Gameguesse

  test "greets the world" do
    assert Gameguesse.hello() == :world
  end
end
