require 'byebug'
def bad_two_sum(arr, target) #O(n^2)
  arr.length.times do |i|
    (1 ... arr.length).each do |j|
      next if i == j
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def quick_sort(arr) # n log n
  return arr if arr.length <= 1

  pivot = arr.pop
  left = arr.select { |el| el <= pivot}
  right = arr.select { |el| el > pivot}

  quick_sort(left) + [pivot] + quick_sort(right)
end

def b_search(arr, target) #log n
  return nil if arr.length <= 0
  midd_idx = arr.length/2
  left = arr.take(midd_idx)
  right = arr.drop(midd_idx + 1)

  if arr[midd_idx] == target
    midd_idx
  elsif target < arr[midd_idx]
    b_search(left, target)
  else
    result = b_search(right, target)
    result.nil? ? nil : result + 1 + midd_idx
  end
end

def okay_two_sum(arr, target) # n log n
  arr = quick_sort(arr) # n log n

  arr = arr.select { |el| el <= target}  # n

# n log n
  arr.each do |el| # n
    search = target - el
    el2 = b_search(arr, search) # log n
    return true unless el2.nil?
  end
  false
end

def two_sum(arr, target) #O(n)
  hash = {}
  arr.each do |el|
    hash[el] = el
  end
  hash.each do |key, value|
    wanted = target - hash[key]
    return true if hash.values.include?(wanted)
  end
  false
end
