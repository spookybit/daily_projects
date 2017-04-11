def windowed_max_range(arr, w) 
  current_max_range = nil
  arr.each_cons(w) do |window|
    if current_max_range.nil? || window.max - window.min > current_max_range
      current_max_range = window.max - window.min
    end
  end
  current_max_range
end
