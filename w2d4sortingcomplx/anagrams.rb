require 'byebug'
def anagram1(str1, str2)
  result = str1.chars.permutation.to_a
  result.include?(str2.split(""))
end

def anagram2(str1, str2)#On^2
  arr1 = str1.chars.dup
  arr2 = str2.chars.dup

  str1.chars.each do |char1|
    str2.chars.each do |char2|
      #byebug
      if char1 == char2
        delete1 = arr1.index(char1)
        delete2 = arr2.index(char2)
        arr1.delete_at(delete1)
        arr2.delete_at(delete2)
        break
      end
    end
  end
  arr1.empty? && arr2.empty?
end

def anagram3(str1, str2)#n
  str1.chars.sort == str2.chars.sort
end

def anagram4(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char { |char| hash1[char] += 1}
  str2.each_char { |char| hash2[char] += 1}
  hash1 == hash2
end

def anagram5(str1, str2)
  hash = Hash.new(0)
  str1.each_char { |char| hash[char] += 1}
  str2.each_char { |char| hash[char] -= 1}
  hash.values.all? { |val| val == 0}
end
