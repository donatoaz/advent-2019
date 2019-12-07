defmodule Dec3Test do
  use ExUnit.Case
  doctest Dec3

  test "simple case" do
    input = """
            R8,U5,L5,D3
            U7,R6,D4,L4
            """
    assert Dec3.manhattan_dist_of_intersection(input) == 6
  end

  test "R75,D30,R83,U83,L12,D49,R71,U7,L72\n         U62,R66,U55,R34,D71,R55,D58,R83" do
    input = """
            R75,D30,R83,U83,L12,D49,R71,U7,L72
            U62,R66,U55,R34,D71,R55,D58,R83
            """
    assert Dec3.manhattan_dist_of_intersection(input) == 159
  end

  test "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\n         U98,R91,D20,R16,D67,R40,U7,R15,U6,R7" do
    input = """
            R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
            U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
            """
    assert Dec3.manhattan_dist_of_intersection(input) == 135
  end

  # this is very slow, ran in 157.2s on my mbp2017 13in
  test "user input" do
    {:ok, contents} = File.read("lib/inputs/dec3.txt")

    assert Dec3.manhattan_dist_of_intersection(contents) == 529
  end
end
