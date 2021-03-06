defmodule Heap do
  @moduledoc """
	Documentation for `Heap` data structure
	
	### Annotations
	- n - number of elements in heap
	"""

  @doc """
  Create new, empty Heap

  ## Examples

			iex> Heap.new()
			[]
      
  """

  def new, do: []

  @doc """
  Return parent index

  ## Examples

			iex> Heap.parent(7)
			3

			iex> Heap.parent(0)
			nil

      
  """

	def parent(index) do
		leaf = Integer.floor_div(index - 1, 2)

		if leaf >= 0, do: leaf, else: nil
	end

  @doc """
  Return left element of index

  ## Examples

			iex> Heap.left(2)
			5

			iex> Heap.left(4)
			9
      
  """

	def left(index), do: index * 2 + 1

  @doc """
  Return right element of index

  ## Examples

			iex> Heap.right(2)
			6
      
  """

  def right(index), do: index * 2 + 2

	defp max_heap(heap, index, len) do
		l = left(index)
		r = right(index)
		largest = if (
			l < len &&
			Enum.at(heap, l) > Enum.at(heap, index)
		), do: l, else: index

		if (
			r < len &&
			Enum.at(heap, r) > Enum.at(heap, largest)
		), do: r, else: largest
	end

	defp min_heap(heap, index, len) do
		l = left(index)
		r = right(index)
		largest = if (
			l < len &&
			Enum.at(heap, l) < Enum.at(heap, index)
		), do: l, else: index

		if (
			r < len &&
			Enum.at(heap, r) < Enum.at(heap, largest)
		), do: r, else: largest
	end

	@doc """
		Method complexity: O(lgn)
		Max heapify changes list of elements in max heap where for each 
		elements of list (except root) ownership takes place:
		Heap[parent(i)] >= Heap[i]

  ## Examples

			iex> Heap.max_heapify([16, 4, 10, 14, 7, 9, 3, 2, 8, 1], 1)
			[16, 14, 10, 8, 7, 9, 3, 2, 4, 1]
      
  """

	def max_heapify(heap, index, len \\ nil) do
		largest = if len != nil, 
			do: max_heap(heap, index, len),
			else: max_heap(heap, index, length(heap))
	
		if largest != index do
			swap(List.to_tuple(heap), index, largest)
				|> Tuple.to_list
				|> max_heapify(largest)
		else
			heap
		end
	end

	@doc """
		Method complexity: O(lgn)
		Min heapify changes list of elements in min heap where for each 
		elements of list (except root) ownership takes place:
		Heap[parent(i)] <= Heap[i]

  ## Examples

			iex> Heap.min_heapify([1, 4, 10, 14, 7, 9, 3, 2, 8, 16], 1)
			[1, 4, 10, 14, 7, 9, 3, 2, 8, 16]
      
  """

	def min_heapify(heap, index, len \\ nil) do
		largest = if len != nil, 
			do: min_heap(heap, index, len),
			else: min_heap(heap, index, length(heap))
	
		if largest != index do
			swap(List.to_tuple(heap), index, largest)
				|> Tuple.to_list
				|> min_heapify(largest)
		else
			heap
		end
	end

	defp swap(heap, i, j) do
    {vi, vj} = {elem(heap, i), elem(heap, j)}
    heap |> put_elem(i, vj) |> put_elem(j, vi)
  end

	@doc """
		Method complexity: O(n)
		Restores ownership of a whole heap to	Heap[parent(i)] >= Heap[i],
		so build heap max

  ## Examples

			iex> Heap.build_heap([4, 1, 3, 2, 16, 9, 10, 14, 8, 7], :max)
			[16, 14, 10, 8, 7, 9, 3, 2, 4, 1]

			iex> Heap.build_heap([16, 4, 9, 14, 7, 10, 3, 2, 8, 1], :max)
			[16, 14, 10, 8, 7, 9, 3, 2, 4, 1]

			iex> Heap.build_heap([16, 4, 9, 14, 7, 10, 3, 2, 8, 1], :min)
			[1, 2, 3, 8, 4, 10, 9, 14, 16, 7]
      
  """ 
	
	def build_heap(heap, type) do
		leaf = Integer.floor_div(length(heap), 2) - 1
		if type == :max, 
		do: build_heap(max_heapify(heap, leaf), type, leaf),
		else: build_heap(min_heapify(heap, leaf), type, leaf)
	end

	defp build_heap(heap, type, i) when i >= 0 do
		if type == :max, 
		do: build_heap(max_heapify(heap, i), type, i - 1),
		else: build_heap(min_heapify(heap, i), type, i - 1)
	end

	defp build_heap(heap, _type, _i), do: heap

end