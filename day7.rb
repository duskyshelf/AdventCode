hash = {}
count = 0
file_length = 0

File.open("day7input.txt", "r") do |f|
  f.each_line do |input|
    file_length += 1
    functions = input.chomp.split(" -> ")
    # if functions[0].split(" ").length == 1
    #   hash[functions[1]] = functions[0]
    # else
      hash[functions[1]] = functions[0].split(" ")
    # end
  end
end

hasharray = hash.sort_by { |key, value| value.length }
hashnew = {}

hasharray.each do |x|
  if x[1].length == 1
    hashnew[x[0]] = x[1][0]
  else
    hashnew[x[0]] = x[1]
  end
end

hashnew.each do |key, value|
  if value.is_a? Array
    value.map! { |element|
      if(hashnew.has_key?(element))
        hashnew[element]
      else
        element
      end
    }
  end
  count += 1
  p key
  p hashnew[key]
  p count.to_s + " / " + file_length.to_s
end

# hashnew.each do |key, value|
#   if value[0] == "NOT"
#     if ~(value[1].to_i) < 0
#       hashnew[key] = ~(value[1].to_i) + 65536
#     else
#       hashnew[key] = ~(value[1].to_i)
#     end
#   end
#   if value[1] == "RSHIFT"
#     if (value[0].to_i >> value[2].to_i) < 0
#       hashnew[key] = (value[0].to_i >> value[2].to_i) + 65536
#     else
#       hashnew[key] = value[0].to_i >> value[2].to_i
#     end
#   end
#   if value[1] == "LSHIFT"
#     if (value[0].to_i << value[2].to_i) < 0
#       hashnew[key] = (value[0].to_i << value[2].to_i) + 65536
#     else
#       hashnew[key] = value[0].to_i << value[2].to_i
#     end
#   end
#   if value[1] == "OR"
#     if (value[0].to_i | value[2].to_i) < 0
#       hashnew[key] = (value[0].to_i | value[2].to_i) + 65536
#     else
#       hashnew[key] = value[0].to_i | value[2].to_i
#     end
#   end
#   if value[1] == "AND"
#     if (value[0].to_i & value[2].to_i) < 0
#       hashnew[key] = (value[0].to_i & value[2].to_i) + 65536
#     else
#       hashnew[key] = value[0].to_i & value[2].to_i
#     end
#   end
# end



p hashnew