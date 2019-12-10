defmodule Dec3Part2 do
  def manhattan_dist_of_intersection(string) do
    routes = string
    |> String.split("\n", trim: true)            # gets each wire
    |> Enum.map(&Dec3.trace_route_for/1)         # gets a list of points each wire visits

    intersections = routes
    |> Enum.reduce(fn a, b -> a -- (a -- b) end) # gets the intersection

    steps_map = routes
    # create a map of point => step_number
    |> Enum.map(fn r -> Enum.with_index(r) |> Enum.reduce(%{}, fn {p, step_n}, map -> Map.put_new(map, p, step_n + 1) end) end)

    intersections
    # create a list of added step nums for each intersection
    |> Enum.map(fn x -> Map.get(List.first(steps_map), x) + Map.get(List.last(steps_map), x) end)
    |> Enum.min() # get the least step sum
  end
end
