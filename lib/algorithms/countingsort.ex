defmodule Countingsort do
  @moduledoc """
  Documentation for `Counting sort` algorithm. All important
  informations about counting sort you can find on
  [Wikipedia](https://en.wikipedia.org/wiki/Counting_sort) page.
	
	### Annotations
	 - n - number of elements in list
	"""

  @doc """
  Sort list
  Normal complexity: O(n)

  ## Examples

    # iex> Countingsort.run([4, 1, 3, 5, 2])
    # [1, 2, 3, 4]
      
  """

  def run([]), do: []

  def run(list) do
    {min, max} = Enum.min_max(list)
    # Create empty touple for each number in <min, max>
    count = Tuple.duplicate(0, max - min + 1)
    # Count the occurrences the same numbers in the list
    counted = Enum.reduce(list, count, fn item, acc ->
      index = item - min
      put_elem(acc, index, elem(acc, index) + 1)
    end)
    
    Enum.flat_map(min..max, &List.duplicate(&1, elem(counted, &1 - min)))
  end

end