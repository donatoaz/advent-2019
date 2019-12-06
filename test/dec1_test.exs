defmodule Dec1Test do
  use ExUnit.Case
  doctest Dec1

  @moduledoc """
  For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
    For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
    For a mass of 1969, the fuel required is 654.
    For a mass of 100756, the fuel required is 33583.
  """

  test "for a mass of 12" do
    assert Dec1.fuel_required("12") == 2
  end

  test "for a mass of 14" do
    assert Dec1.fuel_required("14") == 2
  end

  test "for a mass of 1969" do
    assert Dec1.fuel_required("1969") == 654
  end

  test "for a mass of 100756" do
    assert Dec1.fuel_required("100756") == 33583
  end
end
