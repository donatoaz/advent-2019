defmodule Dec3 do
  def manhattan_dist_of_intersection(string) do
    string
    |> String.split("\n", trim: true)            # gets each wire
    |> Enum.map(&trace_route_for/1)              # gets a list of points the wire visits
    |> Enum.reduce(fn a, b -> a -- (a -- b) end) # gets the intersection
    |> Enum.map(fn {x,y} -> abs(x) + abs(y) end) # sums up the manhattan dist
    |> Enum.min()                                # gets the minimum val
  end

  def trace_route_for(string) do
    {route, _stop_point} =
      string # "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
      |> String.split(",", trim: true) # ["R98", "U47", ..., "R51"]
      |> Enum.map(fn op ->
        [direction | distance] = String.graphemes(op)
        {direction, Integer.parse(Enum.join(distance)) |> elem(0)}
      end)
      |> Enum.flat_map_reduce({0, 0}, fn movement, acc -> points_in_vector(acc, movement) end)

    route
  end

  def points_in_vector({start_x, start_y}, {direction, distance}) do
    steps = Enum.to_list(1..distance)

    case direction do
      "R" ->
        path = Enum.map(steps, fn n -> {start_x + n, start_y} end)
        {path, List.last(path)}

      "D" ->
        path = Enum.map(steps, fn n -> {start_x, start_y - n} end)
        {path, List.last(path)}

      "U" ->
        path = Enum.map(steps, fn n -> {start_x, start_y + n} end)
        {path, List.last(path)}

      "L" ->
        path = Enum.map(steps, fn n -> {start_x - n, start_y} end)
        {path, List.last(path)}

      invalid_direction ->
        IO.puts(:stderr, "INVALID DIRECTION: #{invalid_direction}")
        System.halt(1)
    end
  end
end
