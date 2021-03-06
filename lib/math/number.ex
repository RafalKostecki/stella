defmodule Number do
  @moduledoc """
  Documentation for `Number`.
  """

  @doc """
  Check if y is power of x

  ## Examples

      iex> Number.is_power(10, 1)
      false
      
  """
  def is_power(x, y) do
    cond do
      x == y -> true
      y == 1 -> x == 1
      true -> increment_power(x, y, 1)
    end
  end

  defp increment_power(x, y, pow) do
    cond do
      pow < x -> increment_power(x, y, pow*y)
      pow == x -> true
      true -> false
    end
  end

  @doc """
  Puts a given number to min-max range. In other words, input value
  will be minimum equal to min value or maximum equal to max value.
  Function assumes min < max

  ## Examples

      iex> Number.clamp(10, 1, 2)
      2
      
  """
  def clamp(number, min \\ 0 , max \\ 1) do
    cond do
      number > max -> max
      number < min -> min
      true -> number
    end
  end

  @doc """
  Determines whether number is equal to the other by given epsilon.

  ## Examples

      iex> Number.nearly_equal(1, 1)
      true

      iex> Number.nearly_equal(1, 4)
      false

      iex> Number.nearly_equal(1, 1, 5)
      true

      iex> Number.nearly_equal(-2, 1, 2)
      false
      
  """
  def nearly_equal(x, y, epsilon \\ 1) do
    cond do
      x < 0 && y < 0 -> abs(x + y) < epsilon 
      true -> abs(x - y) < epsilon 
    end
  end
end