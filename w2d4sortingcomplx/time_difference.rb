require 'byebug'
def my_min(list) #O(n^2)
  var_min = list[0]
  list.each_with_index do |el1, i|
    next if el1 > var_min
    list.each_with_index do |el2, j|
      next if i == j
      el1 < el2 ? var_min = el1 : var_min = el2
    end
  end
  var_min
end

def my_min2(list)#O(n)
  var_min = list[0]
  list.each do |el|
    var_min = el if var_min > el
  end
  var_min
end

def largest_sub_sum(list)#O(n^2) + O(n) = O(n^2)
  sub_arrays = []
  list.each_with_index do |el1, i|
    list.each_with_index do |el2, j|
      next if i >= j
      sub_arrays << list[i..j]
    end
  end
  sums_arr = []
  sub_arrays.each do |sub_arr|
    sums_arr << sub_arr.reduce(:+)
  end
  sums_arr.max
end

def largest_sub_sum2(list)
  max_sum = list.first
  until list.empty?
    sum = list.shift
    max_sum = sum if sum > max_sum
    list.each do |el|
      sum = sum + el
      max_sum = sum if sum > max_sum
    end
  end
  max_sum
end

def largest_sub_sum4(list)
  max_sum = list.first

    sum = list.shift
    max_sum = sum if sum > max_sum
    list.each do |el|
      sum = sum + el
      max_sum = sum if sum > max_sum
    end

  max_sum
end

def largest_sub_sum3(list)
  largest = list.max
  (0...list.length).each do |index|
    largest = list[index..-1].reduce(:+) if list[index..-1].reduce > largest
    largest = list[0..index].reduce(:+) if list[index..-1].reduce > largest
  end
  largest
end


def largest_sub_sum5(list)

  largest_total = list.first
  running_total = list.first
  list.each_index do |idx|
    next if idx == 0
    if (list[idx] + running_total) < list[idx]
      running_total = list[idx]
    else
      running_total += list[idx]
    end
    largest_total = running_total if running_total > largest_total
  end
  largest_total
end
[2, 3, 4, -6, 2, 2, 1, 2, -6, 7]
