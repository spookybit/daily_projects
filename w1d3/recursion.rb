require 'byebug'

def range(start, last)
  return [] if last < start
  return [last] if start == last
  [start] + range(start + 1, last)
end

def exp(base, power)
  return 1 if power == 0
  base * exp(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  if power.even?
    exp2(base, power / 2)**2
  else
    base * (exp2(base, (power - 1) / 2) ** 2)
  end
end

def deep_dup(arg)
  return arg if !arg.is_a?(Array)

  arg.map { |el| deep_dup(el)}
end

def fib_iter(num)
  fib = [0 , 1]
  until fib.length == num
    fib << (fib[-1] + fib[-2])
  end
  fib
end

def fib_recurs(num)

  return [1] if num == 1
  return [1, 1] if num == 2

  n = fib_recurs(num - 1)

  n + [n[-1] + n[-2]]

end

def subsets(array)

  return [[]] if array.empty?

  subs = subsets(array[1..-1])
  dubs = subsets(array[1..-1])

  dubs + subs.map { |sub_array| sub_array << array[0] }

end

def permutations(arr)
  return [arr] if arr.length == 1

  result_arr = []

  level_below = permutations(arr[0..-2])

  level_below.each do |sub_arr|
    arr.length.times do |idx|
      result_arr << sub_arr.dup.insert(idx, arr[-1])
    end
  end

  result_arr
end

def bsearch(array, target)
  return nil if array.length == 1 && array[0] != target

  pointer_index = (array.length)/2
  middle = array[pointer_index]
  left_side = array[0...pointer_index]
  right_side = array[pointer_index + 1..-1]

  if middle == target
    pointer_index

  elsif target < middle
    x = bsearch(left_side, target)
    return nil if x == nil
    pointer_index - 1 - x

  else
    y = bsearch(right_side, target)
    return nil if y == nil
    pointer_index + 1 + y
  end

end

def merge_sort(array)
  return array if array.length == 1

  pointer_idx = array.length/2
  left_side = array[0 ... pointer_idx]
  right_side = array[pointer_idx .. -1]

   = merge_sort(right_side)

end
