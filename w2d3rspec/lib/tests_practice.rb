class Array

  def to_sum
    total = 0
    self.each { |x| total += x}
    total
  end

  def my_transpose
    self.transpose
  end

  def stock_picker
    biggest_dif = 0
    min_i = nil
    max_i = nil
    pairs=[]

    self.each_with_index do |price, idx|
      (idx + 1 ... self.length).each do |idx2|
        if self[idx2] - self[idx] > biggest_dif
          pairs = [idx, idx2]
          biggest_dif = self[idx2] - self[idx]
        end
      end
    end
    pairs

  end
end
