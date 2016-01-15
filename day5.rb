def count_vowels(str)
  str.scan(/[aeoui]/).count
end

def check_repeated_character(str)
  str =~ (/((.)\2+)/)
end

def bad_string(str)
  ["ab", "cd", "pq", "xy"].any? { |word| str.include?(word)}
end

def double_pairs(str)
  array = str.split("") + ["555"]
  i = 0
    while i < 18
      if array[2..-1].join.include?(array[0]+array[1])
        return true
      end
      i += 1
      array.rotate!
    end
  return false
end

def alternating_string(str)
  i = 0
  while i < 15
    if str[i] == str[i+2]
      return true
    end
    i += 1
  end
  return false
end

count = 0
while a = STDIN.gets

    if count_vowels(a) >= 3 && check_repeated_character(a) && !bad_string(a)
      count += 1
      p count
    end
  #
  # if ARGV[0] == "two"
  #   if
  #     print a
  #   end
  # end
  #
  # if ARGV[0] == "three"
  #   if !bad_string(a)
  #     count += 1
  #     print a
  #     p count
  #   end
  # end

end

# count = 0
# while a = gets.chomp
#
#   if double_pairs(a) && alternating_string(a)
#     count += 1
#     puts count
#   end
#
# end