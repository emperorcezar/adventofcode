defmodule AdventOfCode do
  def parse(path) do
    File.stream!(path)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [instruction, value] -> [instruction, String.to_integer(value)] end)
  end

  def process([], horizontal, depth, aim), do: horizontal * depth
  def process([["forward", value] | rest], horizontal, depth, aim), do: process(rest, horizontal + value, depth + (aim * value), aim)
  def process([["down", value] | rest], horizontal, depth, aim), do: process(rest, horizontal, depth, aim + value)
  def process([["up", value] | rest], horizontal, depth, aim), do: process(rest, horizontal, depth, aim - value)

  def process(input), do: input |> process(0, 0, 0)

end
input = AdventOfCode.parse("input.txt")

result = AdventOfCode.process(input)
IO.puts("Answer is: #{result}")
