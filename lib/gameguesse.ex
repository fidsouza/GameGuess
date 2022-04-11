defmodule Gameguesse do
  use Application
  require Logger

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    try do
      IO.puts("Lets play Guess the number")

      IO.gets("Pick a difficult number (1,2 or 3):")
      |> input_parse()
      |> check_validate_level()
    rescue
      e ->
        Logger.error(Exception.format(:error, e, __STACKTRACE__))
        reraise e, __STACKTRACE__
    end
  end

  @spec input_parse(any) :: any
  def input_parse(:error) do
    IO.puts("Invalid Level")
    run()
  end

  def input_parse({num, _}) do
    num
  end

  def input_parse(data) do
    data
    |> Integer.parse()
    |> input_parse()
  end

  def pickup_number(:error) do
    IO.puts("Invalid Number check please")
    run()
  end

  def pickup_number(level) do
    level
    |> get_range()
    |> Enum.random()
    |> IO.inspect()
  end

  def get_range(level) do
    cond do
      level === 1 -> 1..10
      level === 2 -> 1..100
      level === 3 -> 1..1000
    end
  end

  def check_validate_level(level) do
    if level > 3 do
      IO.puts("invalid level")
      run()
    else
      Gameguesse.pickup_number(level)
    end
  end
end
