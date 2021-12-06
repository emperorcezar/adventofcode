defmodule AdventOfCode.Day1 do
  def parse(path) do
    File.stream!(path)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.to_integer(&1))
  end

  def increases(inputs) do
    is_increase = Enum.reduce(
      inputs,
      %{last: nil, values: []},
      fn e, acc -> %{last: e, values: acc.values ++ [(if e > acc.last, do: 1, else: 0)]} end)
    Enum.sum(is_increase.values)
  end

  def chunk_increase([a , b, c | rest]) do
    chunk_increase([a, b, c | rest], :infinity, 0)
  end

  def chunk_increase([a, b, c | rest], last, total) do
    sum = a + b + c
    if sum > last do
      chunk_increase([b, c | rest], sum, total + 1)
    else
      chunk_increase([b, c | rest], sum, total)
    end
  end

  def chunk_increase([_|_], _last, total) do
    total
  end
end
inputs = AdventOfCode.Day1.parse("day1.txt")

part1 = AdventOfCode.Day1.increases(inputs)
IO.puts("Answer to Part 1 is: #{part1}")

part2 = AdventOfCode.Day1.chunk_increase(inputs)
IO.puts("Answer to Part 2 is: #{part2}")
