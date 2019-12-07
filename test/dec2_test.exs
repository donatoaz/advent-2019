defmodule Dec2Test do
  use ExUnit.Case
  doctest Dec2

  test "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)" do
    assert Dec2.run("1,0,0,0,99") == "2,0,0,0,99"
  end

  test "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)" do
    assert Dec2.run("2,3,0,3,99") == "2,3,0,6,99"
  end

  test "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)" do
    assert Dec2.run("2,4,4,5,99,0") == "2,4,4,5,99,9801"
  end

  test "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99" do
    assert Dec2.run("1,1,1,4,99,5,6,0,99") == "30,1,1,4,2,5,6,0,99"
  end

  test "part1" do
    {:ok, contents} = File.read("lib/inputs/dec2.txt")

    assert Dec2.build_program(contents)
           |> Map.put(1, 12)
           |> Map.put(2, 2)
           |> Dec2.run_program(_initial_pos = 0)
           |> Map.get(0) == 4714701
  end
end
