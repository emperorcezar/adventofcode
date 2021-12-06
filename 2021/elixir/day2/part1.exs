defmodule AdventOfCode do
  def parse(path) do
    File.stream!(path)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [instruction, value] -> [instruction, String.to_integer(value)] end)
  end

  def process([], forward, depth), do: forward * depth
  def process([["forward", value] | rest], forward, depth), do: process(rest, forward + value, depth)
  def process([["down", value] | rest], forward, depth), do: process(rest, forward, depth + value)
  def process([["up", value] | rest], forward, depth), do: process(rest, forward, depth - value)

  def part1(input), do: input |> process(0, 0)

end
input = AdventOfCode.parse("input.txt")

part1 = AdventOfCode.part1(input)
IO.puts("Answer to Part 1 is: #{part1}")
