defmodule Dec1Part2Test do
  use ExUnit.Case
  doctest Dec1Part2

  @moduledoc """
    So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966.
    The fuel required by a module of mass 100756 and its fuel is:
    33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346.
  """

  test "for a mass of 1969" do
    assert Dec1Part2.fuel_required("1969") == 966
  end

  test "for a mass of 100756" do
    assert Dec1Part2.fuel_required("100756") == 50346
  end
end
