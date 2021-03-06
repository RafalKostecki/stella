defmodule NumberTest do
  use ExUnit.Case
  doctest Number

  test "1 is power of 1" do
    assert Number.is_power(1, 1) == true
  end

  test "1 is not power of 10" do
    assert Number.is_power(10, 1) == false
  end

  test "2 is power of 2" do
    assert Number.is_power(2, 2) == true
  end

  test "2 is power of 16" do
    assert Number.is_power(16, 2) == true
  end

  test "2 is not a power of 15" do
    assert Number.is_power(15, 2) == false
  end

  test "2 is not a power of 32" do
    assert Number.is_power(32, 2) == true
  end

  test "2 is not a power of 256" do
    assert Number.is_power(256, 2) == true
  end

  test "10 is not a power of 100000000000" do
    assert Number.is_power(100000000000, 10) == true
  end

  test "clamp larger" do
    assert Number.clamp(10, 1, 2) == 2
  end

  test "clamp larger, without max" do
    assert Number.clamp(10, 0) == 1
  end

  test "clamp larger, without min" do
    assert Number.clamp(10, nil, 2) == 2
  end

  test "clamp larger, without min and max" do
    assert Number.clamp(10) == 1
  end

  test "clamp smaller" do
    assert Number.clamp(-1, 1, 2) == 1
  end

  test "clamp smaller, without max" do
    assert Number.clamp(-1, 0) == 0
  end

  test "clamp inside" do
    assert Number.clamp(2, 1, 3) == 2
  end

  test "clamp inside without min and max" do
    assert Number.clamp(0.5) == 0.5
  end

  test "clamp equal to min" do
    assert Number.clamp(1, 1, 3) == 1
  end

  test "clamp equal to min, without max" do
    assert Number.clamp(1, 1) == 1
  end

  test "clamp equal to max" do
    assert Number.clamp(3, 1, 3) == 3
  end

  test "nearly equal, positive, positive; without epsilon, true" do
    assert Number.nearly_equal(1, 1) == true
  end

  test "nearly equal, positive, positive, true" do
    assert Number.nearly_equal(1, 1, 1.0001) == true
  end

  test "nearly equal, positive, positive, false" do
    assert Number.nearly_equal(1, 2, 1) == false
  end

  test "nearly equal, negative, positive, false" do
    assert Number.nearly_equal(-2, 1, 3) == false
  end

  test "nearly equal, negative, positive, true" do
    assert Number.nearly_equal(-2, 1, 3.1) == true
  end
  test "nearly equal, positive, negative, true" do
    assert Number.nearly_equal(1, -2, 3.1) == true
  end

  test "nearly equal, positive, negative, false" do
    assert Number.nearly_equal(1, -2, 3) == false
  end

  test "nearly equal, negative, negative, false" do
    assert Number.nearly_equal(-2, -2, 3) == false
  end

  test "nearly equal, negative, negative, true" do
    assert Number.nearly_equal(-2, -2, 4.001) == true
  end
end
