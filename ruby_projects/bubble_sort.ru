# swaps places of two elements in an array
def swap_place(ary, idx_1, idx_2)
  ary[idx_1], ary[idx_2] = ary[idx_2], ary[idx_1]
  ary
end

# finds the array length counting from zero
def ary_length_idx_0(ary)
  ary.length - 1
end

# places the highest num at index -1, and second highest
# at index -2 and so on one by one each time it is called
def sort_1(ary)
  i = 0
  while i < ary_length_idx_0(ary)
    ary = swap_place(ary, i, i + 1) if ary[i] > ary[i + 1]
    i += 1
  end
  ary
end

# Takes array and sorts it using bubble sort
def bubble_sort(ary)
  j = 0
  while j < ary_length_idx_0(ary)
    ary = sort_1(ary)
    j += 1
  end
  p ary
end

# bubble_sort([12,12,12,12,1,59,44,33,12,12])
bubble_sort([28, 94, 67, 23, 65, 12, 49, 30, 55])
